import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _register();
}

class _register extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Masukkan Nama'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Masukkan Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan password'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: SizedBox(
                width: 600,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 3, color: Colors.red))),
                  value: selectedItem,
                  items: item
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 60.0, bottom: 0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> item = ['Kota', 'Bandung', 'Jakarta', 'Bali'];
String? selectedItem = 'Kota';
