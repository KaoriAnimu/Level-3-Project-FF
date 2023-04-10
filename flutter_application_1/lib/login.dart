import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/register.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Hub'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 20, bottom: 0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (email) {
                                if (email != null &&
                                    !EmailValidator.validate(email)) {
                                  return 'Enter Valid email';
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText: 'Masukkan Email',
                                  prefixIcon: Icon(Icons.email)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 25, bottom: 15),
                            child: TextFormField(
                              controller: passwordController,
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 60, right: 60),
                      child: Container(
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              signIn();
                            }
                          },
                          color: Color(0xFFFF0000),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white70),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: RichText(
                          text: TextSpan(
                              text: 'No account? ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignUp,
                                text: 'Register',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.red))
                          ])),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!), backgroundColor: Colors.red));
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
