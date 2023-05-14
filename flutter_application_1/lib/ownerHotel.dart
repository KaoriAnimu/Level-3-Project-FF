import 'package:flutter/material.dart';
import 'package:flutter_application_1/listHotelOwner.dart';

class ownerHotel extends StatefulWidget {
  @override
  State<ownerHotel> createState() => _ownerHotel();
}

class _ownerHotel extends State<ownerHotel> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register Hotel Anda"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 50, bottom: 0),
                  child: TextFormField(
                    // controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama Hotel',
                        hintText: 'Masukkan Nama Hotel',
                        prefixIcon: Icon(Icons.hotel)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nama hotel anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    // controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Alamat Hotel',
                        hintText: 'Masukkan Alamat Hotel',
                        prefixIcon: Icon(Icons.library_books)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi alamat hotel anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fasilitas Hotel',
                        hintText: 'Masukkan fasilitas hotel',
                        prefixIcon: Icon(Icons.hotel)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi fasilitas hotel anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Harga per malam',
                        hintText: 'Masukkan harga per malam',
                        prefixIcon: Icon(Icons.money)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi harga per malam hotel anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextButton(
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Success"),
                                  content:
                                      Text("Hotel anda berhasil ditambahkan"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  content: Text(
                                                      "Apakah anda ingin megelola hotel anda?"),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        listOwnerHotel()),
                                                          );
                                                        },
                                                        child: Text('Ya')),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('Tidak'))
                                                  ],
                                                );
                                              });
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                              });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
