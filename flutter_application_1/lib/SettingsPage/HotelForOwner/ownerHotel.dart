import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';

class ownerHotel extends StatefulWidget {
  @override
  State<ownerHotel> createState() => _ownerHotel();
}

class _ownerHotel extends State<ownerHotel> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(ownerHotelController());
  final user = FirebaseAuth.instance.currentUser!;

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
                    controller: controller.nama,
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
                    controller: controller.alamat,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Alamat Hotel',
                        hintText: 'Masukkan Alamat Hotel',
                        prefixIcon: Icon(Icons.location_city)),
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Gambar Hotel',
                        hintText: 'Masukkan Gambar Hotel',
                        prefixIcon: Icon(Icons.add_a_photo)),
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
                    controller: controller.fasilitas,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Fasilitas Hotel',
                        hintText: 'Masukkan fasilitas hotel',
                        prefixIcon: Icon(Icons.article_outlined)),
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
                    controller: controller.harga,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Harga per malam',
                        hintText: 'Masukkan harga per malam',
                        prefixIcon: Icon(Icons.attach_money_outlined)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi harga per malam hotel anda';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25, bottom: 0),
                  child: TextFormField(
                    controller: controller.harga,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nomor Virtual Account',
                        hintText: 'Masukkan nomor virtual account',
                        prefixIcon: Icon(Icons.money)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi nomor virtual account';
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
                        backgroundColor: Color(0xFFFF0000),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          final data = ownerHotel_Model(
                              nama: controller.nama.text.trim(),
                              alamat: controller.alamat.text.trim(),
                              fasilitas: controller.fasilitas.text.trim(),
                              harga: controller.harga.text.trim(),
                              nova: controller.nova.text.trim(),
                              email: user.email!);
                          ownerHotelController.instance
                              .createPesan(data, context);
                          controller.nama.text = '';
                          controller.alamat.text = '';
                          controller.fasilitas.text = '';
                          controller.harga.text = '';
                          controller.nova.text = '';
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

// showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   title: Text("Success"),
//                                   content:
//                                       Text("Hotel anda berhasil ditambahkan"),
//                                   actions: [
//                                     ElevatedButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return AlertDialog(
//                                                   content: Text(
//                                                       "Apakah anda ingin megelola hotel anda?"),
//                                                   actions: [
//                                                     ElevatedButton(
//                                                         onPressed: () {
//                                                           Navigator.push(
//                                                             context,
//                                                             MaterialPageRoute(
//                                                                 builder:
//                                                                     (context) =>
//                                                                         listOwnerHotel()),
//                                                           );
//                                                         },
//                                                         child: Text('Ya')),
//                                                     ElevatedButton(
//                                                         onPressed: () {
//                                                           Navigator.of(context)
//                                                               .pop();
//                                                         },
//                                                         child: Text('Tidak'))
//                                                   ],
//                                                 );
//                                               });
//                                         },
//                                         child: Text('Ok'))
//                                   ],
//                                 );
//                               });