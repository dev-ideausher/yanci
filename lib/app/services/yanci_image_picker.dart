import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../constants/string_constants.dart';

class YanciImagePicker {
  static imgOpt({required BuildContext context, required Function onBack}) {
    XFile? pickedImage;
    return Get.bottomSheet(
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.kh),
              topRight: Radius.circular(30.kh),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.ksp),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.kh,
                  ),
                  InkWell(
                    onTap: () async {
                      final picker = ImagePicker();
                      pickedImage = await picker.pickImage(source: ImageSource.gallery);
                      Get.back();
                      XFile? xfile = await compressImage(File(pickedImage!.path));
                      onBack(xfile);
                    },
                    child: Text(StringConstants.chooseFromLibrary, textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 20.kh,
                  ),
                  const Divider(),
                  SizedBox(
                    height: 20.kh
                  ),
                  InkWell(
                    onTap: () async {
                      final picker = ImagePicker();
                      pickedImage = await picker.pickImage(source: ImageSource.camera);
                      Get.back();
                      XFile? xfile = await compressImage(File(pickedImage!.path));
                      onBack(xfile);
                    },
                    child: Text(StringConstants.takePhoto, textAlign: TextAlign.start),
                  ),
                  SizedBox(
                    height: 30.kh,
                  ),
                ],
              ),
            ),
          )),
      isDismissible: true,
    );
  }

  static Future<XFile?> compressImage(File originalImage) async {
    final targetPath = originalImage.path;
    final directory = originalImage.parent; // Get the parent directory of the original image
    final fileName = 'compressed_${originalImage.uri.pathSegments.last}'; // Create a new filename
    final compressedPath = '${directory.path}/$fileName'; // Ensure it ends with .jpg

    final compressedImage = await FlutterImageCompress.compressAndGetFile(
      targetPath,
      compressedPath,
      quality: 50,
    );

    if (compressedImage != null) {
      return XFile(compressedImage.path);
    } else {
      // Compression failed, handle the error
      return null;
    }
  }
}
