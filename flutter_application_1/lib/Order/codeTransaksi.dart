import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/controller/pesan_controller.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class codePembayaran extends StatelessWidget {
  String code, harga;

  codePembayaran({Key? key, required this.code, required this.harga})
      : super(key: key);
  final controller = Get.put(pesanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Transaksi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                child: QrImage(
                  data: code,
                  size: 250,
                  embeddedImageStyle:
                      QrEmbeddedImageStyle(size: const Size(100, 100)),
                ),
              ),
            ),
            Text(
              code,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 150,
                child: Text(
                  'Tunjukkan code tersebut kepada reservasi penginapan dan siapkan uang sebesar ${harga}.-',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 50,
                width: 100,
                child: TextButton(
                    onPressed: () {
                      navigatorKey.currentState!
                          .popUntil((route) => route.isFirst);
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFFFF0000)),
                    child: Text('Lanjutkan')),
              ),
            )
          ],
        ));
  }
}
