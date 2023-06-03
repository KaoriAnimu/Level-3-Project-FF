import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/metode.dart';
import 'package:flutter_application_1/controller/pesan_controller.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class pesanPenginapan extends StatefulWidget {
  @override
  State<pesanPenginapan> createState() => _pesanPenginapan();
}

class _pesanPenginapan extends State<pesanPenginapan> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(pesanController());

  DateTime pickedDateIn = DateTime.now();
  DateTime pickedDateOut = DateTime.now();
  int total = 0;
  final formatCurrency = new NumberFormat("#,##0");

  int daysBetween(DateTime from, DateTime to) {
    return (to.difference(from).inHours / 24).round() * 500000;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesan'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: TextEditingController()..text = 'Hotel Ibis',
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
                          firstDate: DateTime.now().subtract(Duration(days: 0)),
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
                          firstDate: DateTime.now().subtract(Duration(days: 0)),
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
                    controller: TextEditingController()..text = 'Rp500,000',
                    enabled: false,
                    decoration: new InputDecoration(
                        labelText: 'Harga Permalam', icon: Icon(Icons.money)),
                  ),
                  TextFormField(
                    controller: controller.total
                      ..text =
                          'Rp${formatCurrency.format(daysBetween(pickedDateIn, pickedDateOut))}',
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => metodePembayaran()));
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
        ));
  }
}
