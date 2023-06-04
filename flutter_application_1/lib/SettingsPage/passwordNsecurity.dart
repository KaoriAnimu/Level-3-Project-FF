import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/controller/register_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';

class pNs extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  final _formkey = GlobalKey<FormState>();

  TextEditingController pwdOld = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController pwd2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Informasi"),
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
                    controller: pwdOld,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password Lama',
                        hintText: 'Masukkan password lama anda',
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi password lama anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 30, bottom: 0),
                  child: TextFormField(
                    controller: pwd,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password Baru',
                        hintText: 'Masukkan password baru anda',
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi Password anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    controller: pwd2,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Re-Type Password',
                        hintText: 'Masukkan kembali password Anda',
                        prefixIcon: Icon(Icons.lock)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi kembali password anda';
                      }
                      if (pwd.text != pwd2.text) {
                        return 'Password anda tidak cocok';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextButton(
                      child: Text(
                        'Perbarui',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFF0000),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          final cred = EmailAuthProvider.credential(
                              email: user.email!, password: pwdOld.text);
                          user.reauthenticateWithCredential(cred).then((value) {
                            user.updatePassword(pwd.text).then((_) {
                              print('succes');
                            }).catchError((error) {
                              print(error);
                            });
                          }).catchError((err) {
                            print(err);
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
