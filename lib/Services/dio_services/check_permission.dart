import 'package:permission_handler/permission_handler.dart';

class CheckPermission {
  Future<bool> isStoragePermission() async {
    // Check for MANAGE_EXTERNAL_STORAGE permission (required for Android 11+)
    if (await Permission.manageExternalStorage.isGranted) {
      return true;
    }

    // Check for storage permissions (for Android 10 and below)
    if (await Permission.storage.isGranted) {
      return true;
    }

    // Request MANAGE_EXTERNAL_STORAGE permission (for Android 11+)
    if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    }

    // Request storage permissions (for Android 10 and below)
    if (await Permission.storage.request().isGranted) {
      return true;
    }

    // Request media permissions (for Android 13+)
    if (await Permission.photos.request().isGranted ||
        await Permission.videos.request().isGranted ||
        await Permission.audio.request().isGranted) {
      return true;
    }

    // If all permissions are denied
    return false;
  }
}