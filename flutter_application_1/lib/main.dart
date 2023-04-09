import 'package:flutter/material.dart';
import 'package:flutter_application_1/codeTransaksi.dart';
import 'package:flutter_application_1/metode.dart';
import 'package:flutter_application_1/notifikasi.dart';
import 'package:flutter_application_1/penginapan.dart';
import 'package:flutter_application_1/pesan.dart';
import 'package:flutter_application_1/register.dart';
import 'package:getwidget/getwidget.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: pesanPenginapan());
  }
}
