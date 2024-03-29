import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/register_controller.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';

class register extends StatefulWidget {
  final VoidCallback onClickedSignIn;

  const register({Key? key, required this.onClickedSignIn}) : super(key: key);

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
          title: Text("Travel Hub"),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) {
                      if (email != null && !EmailValidator.validate(email)) {
                        return 'Enter Valid email';
                      }
                    },
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
                    validator: (value) => value != null && value.length < 6
                        ? 'Masukkan min. 6 char'
                        : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    controller: controller.password2nd,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Konfirmasi Password',
                        hintText: 'Masukkan Kembali Password',
                        prefixIcon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi kembali password anda';
                      } else if (controller.password.text !=
                          controller.password2nd.text) {
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
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFFF0000),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          final user = UserModel(
                            name: controller.nama.text.trim(),
                            email: controller.email.text.trim(),
                          );
                          registerUser();
                          registerController.instance.createUser(user);
                          controller.nama.text = '';
                          controller.email.text = '';
                          controller.password.text = '';
                          controller.password2nd.text = '';
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = widget.onClickedSignIn,
                            text: 'Sign In',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xFFFF0000)))
                      ])),
                )
              ],
            ),
          ),
        ));
  }

  Future registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: controller.email.text.trim(),
        password: controller.password.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message!), backgroundColor: Color(0xFFFF0000)));
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

List<String> item = ['Bandung', 'Jakarta', 'Bali'];
List<String> prov = ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur'];
String? selectedItem = 'Kota';
