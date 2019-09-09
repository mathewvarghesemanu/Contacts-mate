import 'package:business_card/Classes/Current_user.dart' as prefix0;
import 'package:business_card/Classes/getimage.dart';
import 'package:flutter/material.dart';
import '../Classes/Current_user.dart';
import 'package:business_card/Reusable/ReusableWidgets.dart';
import 'package:contacts_service/contacts_service.dart';

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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            new TextFields(newarg: 'name', newuser: newuser),
            new TextFields(newarg: 'designation', newuser: newuser),
            new TextFields(newarg: 'phone number', newuser: newuser),
            new TextFields(newarg: 'email', newuser: newuser),
            GestureDetector(
              onTap: () async {
                Item phone = Item(label: 'Work', value: newuser.phone);
                Item email = Item(label: 'Work', value: newuser.email);

                await checkContactsPermission();
                try {
                  var newContact = Contact(
                    givenName: newuser.name[0],
                    phones: [phone],
                    emails: [email],
                  );

                  await ContactsService.addContact(newContact);
                  print(newContact.phones);
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
    ));
  }
}
