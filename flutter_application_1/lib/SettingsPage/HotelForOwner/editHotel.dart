import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';

class editHotel extends StatelessWidget {
  final String documentId;
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(ownerHotelController());
  final user = FirebaseAuth.instance.currentUser!;
  CollectionReference users = FirebaseFirestore.instance.collection('Hotel');
  editHotel({Key? key, required this.documentId}) : super(key: key);

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
              return SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 50, bottom: 0),
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Gambar Hotel',
                              hintText: 'Masukkan Gambar Hotel',
                              prefixIcon: Icon(Icons.image)),
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
                        padding:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
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
                                    nama: controller.namaEdit.text.trim(),
                                    alamat: controller.alamatEdit.text.trim(),
                                    fasilitas:
                                        controller.fasilitasEdit.text.trim(),
                                    harga: controller.hargaEdit.text.trim(),
                                    email: user.email!);
                                ownerHotelController.instance
                                    .editPesan(data, context, documentId);
                                controller.namaEdit.text = '';
                                controller.alamatEdit.text = '';
                                controller.fasilitasEdit.text = '';
                                controller.hargaEdit.text = '';
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

// body: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30.0, right: 30.0, top: 50, bottom: 0),
//                   child: TextFormField(
//                     controller: controller.nama,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Nama Hotel',
//                         hintText: 'Masukkan Nama Hotel',
//                         prefixIcon: Icon(Icons.hotel)),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Silahkan isi nama hotel anda';
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30.0, right: 30.0, top: 25, bottom: 0),
//                   child: TextFormField(
//                     controller: controller.alamat,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Alamat Hotel',
//                         hintText: 'Masukkan Alamat Hotel',
//                         prefixIcon: Icon(Icons.library_books)),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Silahkan isi alamat hotel anda';
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30.0, right: 30.0, top: 25, bottom: 0),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Gambar Hotel',
//                         hintText: 'Masukkan Gambar Hotel',
//                         prefixIcon: Icon(Icons.image)),
//                     autovalidateMode: AutovalidateMode.onUserInteraction,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Silahkan isi alamat hotel anda';
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30.0, right: 30.0, top: 25, bottom: 0),
//                   child: TextFormField(
//                     controller: controller.fasilitas,
//                     keyboardType: TextInputType.multiline,
//                     maxLines: null,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Fasilitas Hotel',
//                         hintText: 'Masukkan fasilitas hotel',
//                         prefixIcon: Icon(Icons.hotel)),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Silahkan isi fasilitas hotel anda';
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: 30.0, right: 30.0, top: 25, bottom: 0),
//                   child: TextFormField(
//                     controller: controller.harga,
//                     decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Harga per malam',
//                         hintText: 'Masukkan harga per malam',
//                         prefixIcon: Icon(Icons.money)),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Silahkan isi harga per malam hotel anda';
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
//                   child: SizedBox(
//                     width: 200,
//                     height: 50,
//                     child: TextButton(
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       style: TextButton.styleFrom(
//                         backgroundColor: Color(0xFFFF0000),
//                       ),
//                       onPressed: () {
//                         if (_formkey.currentState!.validate()) {
//                           final data = ownerHotel_Model(
//                               nama: controller.nama.text.trim(),
//                               alamat: controller.alamat.text.trim(),
//                               fasilitas: controller.fasilitas.text.trim(),
//                               harga: controller.harga.text.trim(),
//                               email: user.email!);
//                           ownerHotelController.instance
//                               .createPesan(data, context);
//                           controller.nama.text = '';
//                           controller.alamat.text = '';
//                           controller.fasilitas.text = '';
//                           controller.harga.text = '';
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )