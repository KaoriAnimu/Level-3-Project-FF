import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/listHotelOwner.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:get/get.dart';

import 'main.dart';

class tabProfile extends StatefulWidget {
  @override
  State<tabProfile> createState() => _tabProfile();
}

class _tabProfile extends State<tabProfile> {
  final _formkey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.people),
                  title: Text(
                    'Data Pribadi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => profile()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.language),
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
                  leading: Icon(Icons.hotel),
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
                  leading: Icon(Icons.logout),
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
