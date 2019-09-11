import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:business_card/Classes/Current_user.dart';
import 'package:path/path.dart';

Future getPath() async {
  var databasesPath = await getDatabasesPath();

  String path = join(databasesPath, 'data.db');
  return path;
}

Future CreateDB() async {
  try {
    Database database = await openDatabase(await getPath().toString(),
        version: 1, onCreate: (Database database, int version) async {
      await database.execute(
          'CREATE TABLE PersonalData (firstName TEXT,lastName TEXT, designation TEXT, Phone TEXT PRIMARY KEY,email TEXT)');
    });
  } catch (e) {
    print(e);
  }
}

Future AddtoDB(CurrentUser user) async {
  Database database = await openDatabase(await getPath().toString(), version: 1,
      onCreate: (Database database, int version) async {
    await database.execute(
        'CREATE TABLE PersonalData (firstName TEXT,lastName TEXT, designation TEXT, Phone TEXT PRIMARY KEY,email TEXT);');
  });
  await database.execute("DELETE FROM PersonalData;");
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO PersonalData(firstName,lastName, designation, Phone,email) VALUES("' +
            user.firstName +
            '","' +
            user.lastName +
            '","' +
            user.designation +
            '","' +
            user.phone +
            '","' +
            user.email +
            '");');
    JustReadDB();
    print('addtoDB:inserted');
  });
}

Future ReadfromDB(CurrentUser user) async {
  Database database = await openDatabase(getPath().toString(), version: 1);
  List<Map> list = await database.rawQuery('SELECT * FROM PersonalData');
  print(list);
  user.firstName = list[0]['firstName'];
  user.lastName = list[0]['lastName'];
  user.designation = list[0]['designation`'];
  user.phone = list[0]['phone'];
  user.email = list[0]['email'];
  await database.close();
  print('readfromDB:');
}

Future JustReadDB() async {
  Database database = await openDatabase(getPath().toString(), version: 1);
  List<Map> list = await database.rawQuery('SELECT * FROM PersonalData');
  print(list);
//  print('justReadDB:');
}
