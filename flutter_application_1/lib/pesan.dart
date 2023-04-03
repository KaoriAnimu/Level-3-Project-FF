import 'package:flutter/material.dart';
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
      body: Form(
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
              TextField(
                controller: _dateIn,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    labelText: "Tanggal Check In"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    setState(() {
                      _dateIn.text =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              TextField(
                controller: _dateOut,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today_rounded),
                    labelText: "Tanggal Check Out"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    setState(() {
                      _dateOut.text =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                    });
                  }
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
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red),
                        child: Text('Pilih Metode Pembayaran')),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> entries = <String>[
  'Tempat: ',
  'Tanggal Check In: ',
  'Tanggal Check Out: ',
  'Harga per/malam: ',
  'Total harga: '
];

final List<String> hasil = <String>['Lorem', '', '', 'Rp', 'Rp'];
// Ambil dari DB
