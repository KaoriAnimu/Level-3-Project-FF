import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _register();
}

class _register extends State<register> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Masukkan Nama'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan isi nama anda';
                  }
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Masukkan Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan isi email anda';
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silahkan isi password anda';
                  }
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 30.0, right: 30.0, top: 50, bottom: 0),
              child: SizedBox(
                width: 600,
                child: DropdownButtonFormField<String>(
                  hint: Text('Kota'),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 3, color: Colors.red))),
                  items: item
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih kota anda';
                    }
                  },
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
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data diproses')));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> item = ['Bandung', 'Jakarta', 'Bali'];
String? selectedItem = 'Kota';
