import 'package:flutter/material.dart';
import 'package:flutter_application_1/notifikasi.dart';
import 'package:flutter_application_1/penginapan.dart';
import 'package:flutter_application_1/pesan.dart';
import 'package:flutter_application_1/register.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: notifikasi());
  }
}
