import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/metode.dart';
import 'package:flutter_application_1/controller/pesan_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class pesanPenginapan extends StatefulWidget {
  final String documentId, path;
  pesanPenginapan({Key? key, required this.documentId, required this.path})
      : super(key: key);
  @override
  State<pesanPenginapan> createState() =>
      _pesanPenginapan(documentId: documentId, path: path);
}

class _pesanPenginapan extends State<pesanPenginapan> {
  final String documentId, path;
  _pesanPenginapan({Key? key, required this.documentId, required this.path});

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(pesanController());

  final user = FirebaseAuth.instance.currentUser!;

  DateTime pickedDateIn = DateTime.now();
  DateTime pickedDateOut = DateTime.now();
  int total = 0;
  final formatCurrency = new NumberFormat("#,##0");

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(path);
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesan'),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc(documentId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: TextEditingController()
                            ..text = '${data['nama']}',
                          enabled: false,
                          decoration: new InputDecoration(
                              labelText: 'Tempat', icon: Icon(Icons.place)),
                        ),
                        TextFormField(
                          controller: controller.dateIn,
                          readOnly: true,
                          showCursor: true,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "Tanggal Check In"),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 0)),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              setState(() {
                                pickedDateIn = pickedDate;
                                controller.dateIn.text =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                              });
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi tanggal Check out';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controller.dateOut,
                          readOnly: true,
                          showCursor: true,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "Tanggal Check Out"),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 0)),
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              setState(() {
                                pickedDateOut = pickedDate;
                                controller.dateOut.text =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                              });
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Silahkan isi tanggal Check out';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: TextEditingController()
                            ..text =
                                'Rp${formatCurrency.format(int.parse(data['harga']))}',
                          enabled: false,
                          decoration: new InputDecoration(
                              labelText: 'Harga Permalam',
                              icon: Icon(Icons.money)),
                        ),
                        TextFormField(
                          controller: controller.total
                            ..text =
                                'Rp${formatCurrency.format(daysBetween(pickedDateIn, pickedDateOut, data))}',
                          enabled: false,
                          decoration: new InputDecoration(
                              labelText: 'Total Harga',
                              icon: Icon(Icons.monetization_on)),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Container(
                              width: 200,
                              height: 50,
                              child: TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  metodePembayaran()));
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Color(0xFFFF0000)),
                                  child: Text('Pilih Metode Pembayaran')),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }

            return Text("loading");
          },
        ));
  }

  int daysBetween(DateTime from, DateTime to, Map<String, dynamic> data) {
    return (to.difference(from).inHours / 24).round() *
        int.parse(data['harga']);
  }
}
