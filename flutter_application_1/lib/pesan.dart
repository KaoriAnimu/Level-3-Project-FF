import 'package:flutter/material.dart';
import 'package:flutter_application_1/metode.dart';
import 'package:intl/intl.dart';

class pesanPenginapan extends StatefulWidget {
  @override
  State<pesanPenginapan> createState() => _pesanPenginapan();
}

class _pesanPenginapan extends State<pesanPenginapan> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _dateIn = TextEditingController();
  TextEditingController _dateOut = TextEditingController();

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
                    controller: TextEditingController()..text = 'Data',
                    enabled: false,
                    decoration: new InputDecoration(
                        labelText: 'Tempat', icon: Icon(Icons.place)),
                  ),
                  TextFormField(
                    controller: _dateIn,
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
                          _dateIn.text =
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
                    controller: _dateOut,
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
                          _dateOut.text =
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
                    controller: TextEditingController()..text = 'Data',
                    enabled: false,
                    decoration: new InputDecoration(
                        labelText: 'Harga Permalam', icon: Icon(Icons.money)),
                  ),
                  TextFormField(
                    controller: TextEditingController()..text = 'Data',
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
                                backgroundColor: Colors.red),
                            child: Text('Pilih Metode Pembayaran')),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
