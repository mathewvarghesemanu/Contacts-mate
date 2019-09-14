import 'package:ContactsMate/Classes/Current_user.dart';
import 'package:flutter_sms/flutter_sms.dart';

void sendSMS(CurrentUser user, CurrentUser newuser) async {
//    this.show();

  String message = 'Name: ' +
      user.firstName.toString() +
      ' ' +
      user.lastName.toString() +
      '\nPhone No: ' +
      user.Phone.toString() +
      '\nEmail: ' +
      user.email.toString();
  List<String> recipents = [newuser.Phone];
//  print(message);
  String _result =
      await FlutterSms.sendSMS(message: message, recipients: recipents)
          .catchError((onError) {
    print(onError);
  });
  print(_result);
}
