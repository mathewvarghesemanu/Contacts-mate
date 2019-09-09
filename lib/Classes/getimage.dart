import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.camera);
  return image;
}

checkContactsPermission() async {
  Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
}
