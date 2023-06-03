import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/register.dart';

class authPage extends StatefulWidget {
  @override
  State<authPage> createState() => _authPage();
}

class _authPage extends State<authPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginPage(onClickedSignUp: toggle)
      : register(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
