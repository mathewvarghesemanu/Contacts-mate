import 'package:business_card/Classes/Current_user.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

CopyPaste(CurrentUser user) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String pastePath = appDocDir.path;
  String copyPath = user.image.path;
  final File newImage = await user.image.copy('$pastePath/image1.jpg');
}

ImageProvider getImageProvider(String f) {
  try {
    var i1 = FileImage(File(f + '/image1.jpg'));
    return i1;
  } catch (e) {
    var i2 = AssetImage('img/Mathew Varghese.jpg');
    return i2;
  }

//  return await File(f).exists()
//      ? FileImage(File(f))
//      : const AssetImage('img/Mathew Varghese.jpg');
}
