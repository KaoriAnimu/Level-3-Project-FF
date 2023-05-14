import 'package:flutter/material.dart';
import 'package:flutter_application_1/metode.dart';
import 'metode.dart';
import 'dart:math';

class pembayaran extends StatelessWidget {
  final Detail detail;
  final String code = generateRandomString(6);

  pembayaran({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detail.title),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                child: ListTile(
                  leading: detail.icons,
                  title: Text(
                    detail.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                  detail.isi,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
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
            Container(
              width: 200,
              height: 50,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red),
                  child: Text(
                    'Pesan',
                    style: TextStyle(fontSize: 24),
                  )),
            )
          ],
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
