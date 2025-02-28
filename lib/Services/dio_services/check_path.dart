import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class DirectoryPath {
  Future<String?> getPath(String fileName) async {
    // Check and request storage permissions
    if (await Permission.manageExternalStorage.request().isGranted ||
        await Permission.storage.request().isGranted) {
      try {
        // Get the public Downloads directory
        Directory downloadsDir = Directory('/storage/emulated/0/Download');

        // Create a custom folder inside the Downloads directory
        Directory customDir = Directory('${downloadsDir.path}/Asset');

        if (!customDir.existsSync()) {
          await customDir.create(recursive: true);
        }

        // Return the complete file path
        return '${customDir.path}';
      } catch (e) {
        print("Error accessing Downloads folder: $e");
        return null;
      }
    } else {
      print("Storage permission denied.");
      return null;
    }
  }
}
