import 'dart:io';

import 'package:admin/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper_for_web/image_cropper_for_web.dart';

class NotificationController extends GetxController {
  RxString photoUrl = "assets/icons/Figma_file.svg".obs;

  List<bool> selectedList = [];

  @override
  void onInit() {
    selectedList = List<bool>.generate(users.length, (int index) => false);
    // print(selectedList);
    super.onInit();
  }

  // Image Picker
  File? imageFile;
  RxString? altImage = "images/bmsLogo.png".obs;
  final ImagePicker picker = ImagePicker();
  CroppedFile? croppedFile;

  pickImage(BuildContext context) async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      // final extension = pickedFile.path;
      // print("Extension : $extension");
      await imageCropper(imageFile, context);
    }
  }

  imageCropper(File? originalImageFile, BuildContext context) async {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: originalImageFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: buildUiSettings(context),
    );
    if (croppedFile != null) {
      imageFile = File(croppedFile!.path);
      photoUrl.value = croppedFile!.path;
    }
  }
}

List<PlatformUiSettings>? buildUiSettings(BuildContext context) {
  return [
    WebUiSettings(
      context: context,
      presentStyle: CropperPresentStyle.dialog,
      boundary: Boundary(
        width: 220,
        height: 220,
      ),
      viewPort: ViewPort(width: 200, height: 200, type: 'square'),
      enableExif: true,
      enableZoom: true,
      showZoomer: true,
    ),
  ];
}
