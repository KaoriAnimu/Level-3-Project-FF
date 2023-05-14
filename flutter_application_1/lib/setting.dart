import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/listHotelOwner.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';

class settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<settings> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text(
                    'Informasi Akun',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Password & Security',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Bahasa',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Register Hotel',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Get.to(() => listOwnerHotel());
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Log Out',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    navigatorKey.currentState!
                        .popUntil((route) => route.isFirst);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
