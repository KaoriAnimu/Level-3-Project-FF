import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ownerHotel extends StatefulWidget {
  @override
  State<ownerHotel> createState() => _ownerHotel();
}

class _ownerHotel extends State<ownerHotel> {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(ownerHotelController());
  final user = FirebaseAuth.instance.currentUser!;
  PlatformFile? pickedFile;
  var urlDownload;
  final formatCurrency = new NumberFormat("#,##0");
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

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
                    controller: controller.deskripsi,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Deskripsi Hotel',
                        hintText: 'Masukkan Deskripsi Hotel',
                        prefixIcon: Icon(Icons.library_books)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Silahkan isi Deskripsi hotel anda';
                      }
                    },
                  ),
                ),
                Column(
                  children: [
                    if (pickedFile != null)
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 25, bottom: 0),
                        child: TextFormField(
                          controller: controller.gambar
                            ..text = pickedFile!.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Gambar Hotel',
                              hintText: 'Masukkan Gambar Hotel',
                              prefixIcon: Icon(Icons.image)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan isi alamat hotel anda';
                            }
                          },
                        ),
                      ),
                    if (pickedFile == null)
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 25, bottom: 0),
                        child: TextFormField(
                          controller: controller.gambar..text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Gambar Hotel',
                              hintText: 'Masukkan Gambar Hotel',
                              prefixIcon: Icon(Icons.image)),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silahkan isi alamat hotel anda';
                            }
                          },
                        ),
                      )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 25, bottom: 0),
                    child: ElevatedButton(
                      child: Text('Upload File'),
                      onPressed: () {
                        selectFile();
                      },
                    )),
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
                    controller: controller.harga,
                    keyboardType: TextInputType.number,
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
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 30.0, bottom: 30),
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
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          final file = File(pickedFile!.path!);
                          final path =
                              '${controller.nama.text}/${pickedFile!.name}';

                          final ref =
                              FirebaseStorage.instance.ref().child(path);
                          uploadTask = ref.putFile(file);

                          final snapshot =
                              await uploadTask!.whenComplete(() {});
                          urlDownload = await snapshot.ref.getDownloadURL();
                          final data = ownerHotel_Model(
                              nama: controller.nama.text.trim(),
                              alamat: controller.alamat.text.trim(),
                              fasilitas: controller.fasilitas.text.trim(),
                              harga: controller.harga.text.trim(),
                              email: user.email!,
                              gambarUrl: urlDownload,
                              deskripsi: controller.deskripsi.text.trim(),
                              gambarNama: pickedFile!.name);
                          ownerHotelController.instance
                              .createPesan(data, context);
                          controller.nama.text = '';
                          controller.alamat.text = '';
                          controller.fasilitas.text = '';
                          controller.harga.text = '';
                          controller.gambar.text = '';
                          controller.deskripsi.text = '';
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