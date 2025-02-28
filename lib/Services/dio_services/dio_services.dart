import 'dart:io';
import 'package:dio/dio.dart';
import 'package:asset/Services/dio_services/check_path.dart';
import 'package:asset/Services/dio_services/check_permission.dart';
import 'package:universal_html/html.dart' as html;
class DioServices {
  final Dio _dio = Dio();
  final DirectoryPath directoryPath = DirectoryPath();
  final CheckPermission checkPermission = CheckPermission();

  Future<String?> downloadFile(
      String url,
      String fileName, {
        Function(int received, int total)? onProgress,
      }) async {
    try {
      // Check storage permissions
      if (!await checkPermission.isStoragePermission()) {
        print("Storage permission denied.");
        return null;
      }

      // Get the custom directory path
      String? customDirPath = await directoryPath.getPath(fileName);
      if (customDirPath == null) {
        print("Could not get the custom directory path.");
        return null;
      }

      // Generate a unique file name if the file already exists
      String uniqueFileName = _getUniqueFileName(customDirPath, fileName);

      // Define the file path
      String filePath = '$customDirPath/$uniqueFileName';

      // Download the file
      await _dio.download(
        url,
        filePath,
        onReceiveProgress: onProgress, // Pass the progress callback
      );

      return filePath;
    } catch (e) {
      print("Error downloading file: $e");
      return null;
    }
  }

  // Helper function to generate a unique file name
  String _getUniqueFileName(String directoryPath, String fileName) {
    String baseName = fileName;
    String extension = '';
    int dotIndex = fileName.lastIndexOf('.');
    if (dotIndex != -1) {
      baseName = fileName.substring(0, dotIndex);
      extension = fileName.substring(dotIndex);
    }

    String uniqueFileName = fileName;
    int counter = 1;

    // Check if the file already exists
    while (File('$directoryPath/$uniqueFileName').existsSync()) {
      uniqueFileName = '$baseName ($counter)$extension';
      counter++;
    }

    return uniqueFileName;
  }
}


class WebDownload {
  void downloadFile(String url, String fileName) {
    try {
      if (url.isEmpty || fileName.isEmpty) {
        throw ArgumentError("URL and file name cannot be empty.");
      }

      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", fileName)
        ..style.display = "none";

      html.document.body?.append(anchor);
      anchor.click();
      anchor.remove();
    } catch (e) {
      print("Error downloading file: $e");
    }
  }
}
