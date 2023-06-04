import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/codeTransaksi.dart';
import 'package:flutter_application_1/controller/pesan_controller.dart';
import 'package:flutter_application_1/model/pesan_model.dart';
import 'dart:math';
import 'package:get/get.dart';

class metodePembayaran extends StatefulWidget {
  @override
  State<metodePembayaran> createState() => _metodePembayaran();
}

class _metodePembayaran extends State<metodePembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Metode Pembayaran'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Bayar Ditempat',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {
                    Get.to(() => bayarDitempat());
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class bayarDitempat extends StatelessWidget {
  final controller = Get.put(pesanController());
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bayar Ditempat'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      'Bayar Ditempat',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: Text(
                    'Syarat & Ketentuan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(
                height: 20,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: Text(
                    'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  width: 200,
                  height: 50,
                  child: TextButton(
                      onPressed: () {
                        final pesan = pesanModel(
                            namaHotel: controller.namaHotel.text.trim(),
                            dateIn: controller.dateIn.text.trim(),
                            dateOut: controller.dateOut.text.trim(),
                            total: controller.total.text.trim(),
                            code: controller.code.text.trim(),
                            email: user.email!);
                        pesanController.instance.createPesan(pesan);
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFFF0000)),
                      child: Text(
                        'Pesan',
                        style: TextStyle(fontSize: 24),
                      )),
                ),
              ),
              TextField(
                  controller: controller.code..text = generateRandomString(6),
                  enabled: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  )),
            ],
          ),
        ));
  }
}

String generateRandomString(int length) {
  final random = Random();
  const availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  final randomString = List.generate(length,
      (index) => availableChars[random.nextInt(availableChars.length)]).join();

  return randomString;
}
