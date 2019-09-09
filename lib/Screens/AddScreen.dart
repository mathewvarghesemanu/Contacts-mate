import 'package:business_card/Classes/Current_user.dart' as prefix0;
import 'package:business_card/Classes/getimage.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  final user = CurrentUser();
  final newuser = NewUser();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
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
                  backgroundColor: Colors.lightGreen,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFields(newarg: 'firstName', newuser: newuser),
                  ),
                  Expanded(
                      child: TextFields(newarg: 'lastName', newuser: newuser)),
                ],
              ),
              TextFields(newarg: 'designation', newuser: newuser),
              TextFields(newarg: 'phone number', newuser: newuser),
              TextFields(newarg: 'email', newuser: newuser),
              GestureDetector(
                onTap: () async {
                  Item phone = Item(label: 'Work', value: newuser.phone);
                  Item email = Item(label: 'Work', value: newuser.email);

                  await checkContactsPermission();
                  try {
                    Contact newContact = Contact(
                      givenName: newuser.firstName,
                      familyName: newuser.lastName,
                      phones: [phone],
                      emails: [email],
                    );

                    print(newContact.givenName);
                    print(newContact.phones.toList()[0].value);
                    print(newContact.emails.toList()[0].value);
                    loading = true;
                    await ContactsService.addContact(newContact);
                    loading = false;
                  } catch (e) {
                    print('error*********assas');
                  }
                },
                child: ApplyCard(
                  label: 'Add as a new contact',
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.ac_unit,
                ),
                label: Text('Cypher'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}