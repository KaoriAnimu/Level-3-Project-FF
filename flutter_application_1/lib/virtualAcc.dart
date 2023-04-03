import 'package:flutter/material.dart';

class virtualAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Metode Pembayaran'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                child: ListTile(
                  leading: Icon(Icons.account_balance),
                  title: Text(
                    'Virtual Account',
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
                  'Uang yang akan ditransferkan sebesar Rp. xxx.xxx,- code pembayaran akan ditampilkan saat tombal pesan ditekan',
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
