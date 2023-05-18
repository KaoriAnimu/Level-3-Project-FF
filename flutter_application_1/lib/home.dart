import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/navbar/bookmark.dart';
import 'package:flutter_application_1/navbar/halamanDepan.dart';
import 'package:flutter_application_1/navbar/pesanan.dart';
import 'package:flutter_application_1/navbar/tabProfile.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _home();
}

final user = FirebaseAuth.instance.currentUser!;

class _home extends State<homePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    halamanDepan(),
    pesanan(),
    Bookmark(),
    tabProfile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 207, 12, 12),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'PESANAN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'BOOKMARK',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
      ),
    );
  }
}
