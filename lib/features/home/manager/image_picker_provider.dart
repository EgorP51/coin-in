import 'dart:io';

import 'package:coin_in/core/ui/style.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  Future<void> pickImageAndCrop(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: kAmber,
          toolbarWidgetColor: kWhite,
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );

    if (croppedFile != null) {
      _selectedImage = File(croppedFile.path);
      notifyListeners();
    }
  }

  void clearImage() {
    _selectedImage = null;
    notifyListeners();
  }
}
