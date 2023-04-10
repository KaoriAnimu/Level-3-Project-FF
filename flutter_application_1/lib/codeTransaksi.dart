import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/pesan_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class codePembayaran extends StatefulWidget {
  @override
  State<codePembayaran> createState() => _codePembayaran();
}

class _codePembayaran extends State<codePembayaran> {
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
                  data: controller.code.text,
                  size: 250,
                  embeddedImageStyle:
                      QrEmbeddedImageStyle(size: const Size(100, 100)),
                ),
              ),
            ),
            Text(
              controller.code.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 150,
                child: Text(
                  'Tunjukkan code tersebut kepada reservasi penginapan dan siapkan uang Rp.xxx.xxx',
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
                      Get.to(() => homePage());
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red),
                    child: Text('Lanjutkan')),
              ),
            )
          ],
        ));
  }
}
