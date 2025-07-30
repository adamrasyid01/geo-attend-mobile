
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class NativeApiService {
  // Take Selfie Camera
  static Future<File?> takeSelfie() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }


}