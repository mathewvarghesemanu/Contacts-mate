import 'package:business_card/Classes/Current_user.dart';
import 'package:business_card/Classes/getimage.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:business_card/sendSMS.dart';

var newvar;

class AddScreen extends StatelessWidget {
  final String id = 'AddScreen';

  @override
  Widget build(BuildContext context) {
    return AddaScreen();
  }
}

class AddaScreen extends StatefulWidget {
  @override
  _AddaScreenState createState() => _AddaScreenState();
}

class _AddaScreenState extends State<AddaScreen> {
  NewUser newuser = NewUser();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.teal,
          appBar: AppBar(
            title: Text('Add New Contact'),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                size: 35,
                color: Colors.white70,
              ),
            ),
            backgroundColor: Colors.teal,
          ),
          body: ModalProgressHUD(
            inAsyncCall: loading,
            child: SafeArea(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: CircleAvatar(
                        child: Icon(
                          Icons.add,
                          size: 80,
                          color: Colors.teal,
                        ),
                        radius: 75.0,
                        backgroundColor: Colors.cyan[300]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:
                            TextFields(newarg: '*firstName', newuser: newuser),
                      ),
                      Expanded(
                          child: TextFields(
                              newarg: '*lastName', newuser: newuser)),
                    ],
                  ),
                  TextFields(newarg: 'designation', newuser: newuser),
                  TextFields(newarg: '*phone number', newuser: newuser),
                  TextFields(newarg: 'email', newuser: newuser),
                  GestureDetector(
                    onTap: () async {
                      print(newuser.firstName);
                      Item phone = Item(label: 'Work', value: newuser.Phone);
                      Item email = Item(label: 'Work', value: newuser.email);
                      if (newuser.Phone == null ||
                          newuser.firstName == null ||
                          newuser.lastName == null) {
                        print(newuser.Phone);
                        Fluttertoast.showToast(
                            msg:
                                "First Name, Last Name and Phone Number are mandatory to save the contact",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
//                      } else {
                        await checkContactsPermission();
                        try {
                          Contact newContact = Contact(
                            givenName: newuser.firstName,
                            familyName: newuser.lastName,
                            phones: [phone],
                            emails: [email],
                          );

//                          print(newContact.givenName);
//                          print(newContact.phones.toList()[0].value);
//                          print(newContact.emails.toList()[0].value);
                          loading = true;
                          await ContactsService.addContact(newContact);
                          loading = false;
                          Alert(
                                  content: InkWell(
                                    onTap: () {
//                                      user.firstName = 'a';
//                                      user.lastName = 'b';
//                                      user.designation = 'c';
//                                      user.Phone = '9446542580';
//                                      user.email = 'man@man.com';
//                                      newuser.Phone = '9446542580';
                                      sendSMS(user, newuser);
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Colors.white70,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        child: Text(
                                          "Send SMS",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  context: context,
                                  title: "Contact Added",
                                  type: AlertType.success,
                                  desc: newContact.givenName)
                              .show();
                        } catch (e) {
                          print('error**in SMS or Contact');
                        }
                      }
                    },
                    child: ApplyCard(
                      label: 'Add as a new contact',
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      Alert(
                          context: context,
                          title: "SCAN ME TO INSTALL",
                          content: QrImage(
                            data: playLink,
                            version: QrVersions.auto,
                            size: 320,
                            gapless: false,
                          )).show();
                    },
                    icon: Icon(
                      Icons.ac_unit,
                    ),
                    label: Text('Share this app'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
