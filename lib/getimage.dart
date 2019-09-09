import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  return image;
}
