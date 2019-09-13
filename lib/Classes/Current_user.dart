import 'package:flutter_sms/flutter_sms.dart';
import 'dart:io';

String playLink = 'Google Play';

class CurrentUser {
  void QRGenerate() {
    QRText = 'MECARD:N:' +
        this.lastName +
        ',' +
        this.firstName +
        ';EMAIL:' +
        this.email +
        ';TEL:+91' +
        this.Phone +
        ';';
  }

  void show() {
    print(this.firstName);
    print(this.lastName);
    print(this.designation);
    print(this.Phone);
    print(this.email);
  }

  String firstName;
  String lastName;

  String designation;

  String Phone;
  String email;
  String QRText;
  File image;
}

class NewUser {
  String firstName;
  String lastName;

  String designation;
  var Phone;
  var email;
}

final user = CurrentUser();
