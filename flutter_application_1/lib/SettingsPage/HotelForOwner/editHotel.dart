import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';

class editHotel extends StatefulWidget {
  final String documentId;
  editHotel({Key? key, required this.documentId}) : super(key: key);
  @override
  State<editHotel> createState() => _editHotel(documentId: documentId);
}

class _editHotel extends State<editHotel> {
  final String documentId;
  _editHotel({Key? key, required this.documentId});
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(ownerHotelController());
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('Hotel');
  UploadTask? uploadTask;
  PlatformFile? pickedFile;

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
          title: Text("Edit Hotel Anda"),
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
              var urlDownload = data['gambar'];
              return SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 30, bottom: 0),
                        child: TextFormField(
                          controller: controller.namaEdit..text = data['nama'],
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
                          controller: controller.alamatEdit
                            ..text = data['alamat'],
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
                          controller: controller.deskripsiEdit
                            ..text = data['deskripsi'],
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
                                controller: controller.gambarEdit
                                  ..text = pickedFile!.name,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Gambar Hotel',
                                    hintText: 'Masukkan Gambar Hotel',
                                    prefixIcon: Icon(Icons.image)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                controller: controller.gambarEdit
                                  ..text = data['gambarNama'],
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Gambar Hotel',
                                    hintText: 'Masukkan Gambar Hotel',
                                    prefixIcon: Icon(Icons.image)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                          controller: controller.fasilitasEdit
                            ..text = data['fasilitas'],
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
                          controller: controller.hargaEdit
                            ..text = data['harga'],
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
                                if (pickedFile != null) {
                                  final file = File(pickedFile!.path!);
                                  final path =
                                      '${controller.nama.text}/${pickedFile!.name}';

                                  final ref = FirebaseStorage.instance
                                      .ref()
                                      .child(path);
                                  uploadTask = ref.putFile(file);

                                  final snapshot =
                                      await uploadTask!.whenComplete(() {});
                                  urlDownload =
                                      await snapshot.ref.getDownloadURL();
                                }

                                final data = ownerHotel_Model(
                                    nama: controller.namaEdit.text.trim(),
                                    alamat: controller.alamatEdit.text.trim(),
                                    fasilitas:
                                        controller.fasilitasEdit.text.trim(),
                                    harga: controller.hargaEdit.text.trim(),
                                    email: user.email!,
                                    gambarUrl: urlDownload,
                                    deskripsi:
                                        controller.deskripsiEdit.text.trim(),
                                    gambarNama:
                                        controller.gambarEdit.text.trim());
                                ownerHotelController.instance
                                    .editPesan(data, context, documentId);
                                controller.namaEdit.text = '';
                                controller.alamatEdit.text = '';
                                controller.fasilitasEdit.text = '';
                                controller.hargaEdit.text = '';
                                controller.gambarEdit.text = '';
                                controller.deskripsiEdit.text = '';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return Text("loading");
          },
        ));
  }
}
