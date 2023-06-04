import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/controller/register_controller.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:flutter_application_1/model/user_model.dart';
import 'package:get/get.dart';

class informasiAkun extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final controller = Get.put(registerController());
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: user.email)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text("Informasi"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return SingleChildScrollView(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 50, bottom: 0),
                          child: TextFormField(
                            controller: controller.namaEdit
                              ..text = data['nama'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Nama',
                                hintText: 'Masukkan Nama anda',
                                prefixIcon: Icon(Icons.people)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan isi nama anda';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 25, bottom: 0),
                          child: TextFormField(
                            controller: controller.kotaEdit
                              ..text = data['kota'],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Kota',
                                hintText: 'Masukkan Kota Anda',
                                prefixIcon: Icon(Icons.location_city)),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Silahkan isi Kota anda';
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 25, bottom: 0),
                          child: TextFormField(
                            controller: controller.email..text = user.email!,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.hotel)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 30.0),
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: TextButton(
                              child: Text(
                                'Perbarui',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFFFF0000),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  final datas = UserModel(
                                      name: controller.namaEdit.text,
                                      email: user.email!,
                                      kota: controller.kotaEdit.text);
                                  registerController.instance
                                      .editPesan(datas, document.id);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
