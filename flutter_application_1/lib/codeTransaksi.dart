import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class codePembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transaksi'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                alignment: Alignment.center,
                child: QrImage(
                  data: 'haha',
                  size: 250,
                  embeddedImageStyle:
                      QrEmbeddedImageStyle(size: const Size(100, 100)),
                ),
              ),
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
                    onPressed: () {},
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
