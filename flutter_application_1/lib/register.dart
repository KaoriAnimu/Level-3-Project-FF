import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pesan.dart';
import 'package:flutter_application_1/register_controller.dart';
import 'package:flutter_application_1/user_model.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _register();
}

class _register extends State<register> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(registerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 50, bottom: 0),
                  child: TextFormField(
                    controller: controller.nama,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Masukkan Nama',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nama anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Masukkan Email',
                        prefixIcon: Icon(Icons.email)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    controller: controller.password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Masukkan Password',
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi password anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Konfirmasi Password',
                        hintText: 'Masukkan Kembali Password',
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi kembali password anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: SizedBox(
                    width: 600,
                    child: DropdownButtonFormField<String>(
                      hint: Text('Kota'),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(width: 3, color: Colors.red)),
                          prefixIcon: Icon(Icons.location_city)),
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
                          final user = UserModel(
                              name: controller.nama.text.trim(),
                              email: controller.email.text.trim(),
                              kota: 'Kota');
                          registerController.instance.createUser(user);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

List<String> item = ['Bandung', 'Jakarta', 'Bali'];
String? selectedItem = 'Kota';
