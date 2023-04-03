import 'package:flutter/material.dart';
import 'package:flutter_application_1/bayarDitempat.dart';
import 'package:flutter_application_1/virtualAcc.dart';

class metodePembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: ListTile(
              leading: Icon(Icons.home),
              title: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => bayarDitempat()));
                },
                child: Text(
                  'Bayar Ditempat',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: ListTile(
              leading: Icon(Icons.account_balance),
              title: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => virtualAccount()));
                },
                child: Text(
                  'Virtual Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
