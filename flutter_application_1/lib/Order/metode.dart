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
  List<Detail> details = [
    const Detail(
        title: 'Bayar Ditempat',
        isi:
            'Silahkan siapkan uang sebesar Rp. xxx.xxx,- saat saat sampai di tempat',
        icons: Icon(Icons.home)),
    const Detail(
        title: 'Virtual Account',
        isi:
            'Uang yang akan ditransferkan sebesar Rp. xxx.xxx,- code pembayaran akan ditampilkan saat tombal pesan ditekan',
        icons: Icon(Icons.account_balance))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Metode Pembayaran'),
        ),
        body: ListView.builder(
            itemCount: details.length,
            itemBuilder: (context, index) {
              final detail = details[index];

              return Card(
                child: ListTile(
                  leading: detail.icons,
                  title: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      detail.title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => bayarDitempat(detail: detail)));
                  },
                ),
              );
            }));
  }
}

class Detail {
  final String title;
  final String isi;
  final Icon icons;

  const Detail({required this.title, required this.isi, required this.icons});
}

class bayarDitempat extends StatelessWidget {
  final Detail detail;
  final controller = Get.put(pesanController());
  final user = FirebaseAuth.instance.currentUser!;

  bayarDitempat({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detail.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  child: ListTile(
                    leading: detail.icons,
                    title: Text(
                      detail.title,
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
                    detail.isi,
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
                          backgroundColor: Colors.red),
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


// class secondPage extends StatelessWidget {
//   final Detail detail;

//   const secondPage({
//     Key? key,
//     required this.detail,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(detail.username),
//         ),
//         body: Center(
//           child: Text(
//             '${detail.username}\n${detail.isi}',
//             textAlign: TextAlign.center,
//           ),
//         ),
//       );
// }

// body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
//             child: ListTile(
//               leading: Icon(Icons.home),
//               title: TextButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => bayarDitempat()));
//                 },
//                 child: Text(
//                   'Bayar Ditempat',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//           const Divider(
//             height: 20,
//             thickness: 1,
//             indent: 20,
//             endIndent: 20,
//             color: Colors.black,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
//             child: ListTile(
//               leading: Icon(Icons.account_balance),
//               title: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => virtualAccount()));
//                 },
//                 child: Text(
//                   'Virtual Account',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),