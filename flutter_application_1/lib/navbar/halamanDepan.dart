import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/hotel.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/bookmark_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Home/notifikasi.dart';

class halamanDepan extends StatefulWidget {
  @override
  State<halamanDepan> createState() => _halamanDepan();
}

class _halamanDepan extends State<halamanDepan> {
  final _formkey = GlobalKey<FormState>();
  final formatCurrency = new NumberFormat("#,##0");

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection(
          'Hotel',
        )
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Color(0x4D000000),
                    offset: Offset(0, 2),
                  )
                ],
                shape: BoxShape.rectangle,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(29, 18, 10, 18),
                      child: Container(
                        width: 312,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Color(0xD4D9D9D9),
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Pencarian',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 10),
                                    ),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(),
                  //   child: IconButton(
                  //     icon: Icon(Icons.notifications),
                  //     color: Colors.yellow,
                  //     onPressed: () {
                  //       Get.to(() => notifikasi());
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }
            if (!snapshot.hasData) {
              return Center(child: Text('Data kosong'));
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => hotel(
                                            documentId: document.id,
                                            path: 'Hotel',
                                          ));
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          data['gambar'],
                                          width: 347,
                                          height: 183,
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 0),
                                                child: Text(
                                                  '${data['nama']}',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Text(
                                                        'Rp${formatCurrency.format(int.parse(data['harga']))}.- / malam',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Container(),
                                                        RatingBarIndicator(
                                                            rating: 4,
                                                            itemCount: 5,
                                                            itemSize: 30.0,
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .yellow,
                                                                    )),
                                                        IconButton(
                                                          icon: Icon(
                                                              Icons.thumb_up),
                                                          onPressed: () {
                                                            final datas = bookmark_Model(
                                                                nama: data[
                                                                    'nama'],
                                                                alamat: data[
                                                                    'alamat'],
                                                                fasilitas: data[
                                                                    'fasilitas'],
                                                                harga: data[
                                                                    'harga'],
                                                                email:
                                                                    user.email!,
                                                                gambarNama: data[
                                                                    'gambarNama'],
                                                                gambarUrl: data[
                                                                    'gambar'],
                                                                deskripsi: data[
                                                                    'deskripsi']);

                                                            Get.lazyPut(() =>
                                                                ownerHotelController
                                                                    .instance
                                                                    .createBookmark(
                                                                        datas,
                                                                        context));

                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'Bookmark')
                                                                .add(datas
                                                                    .toJson())
                                                                .then((value) =>
                                                                    print(
                                                                        "User Updated"))
                                                                .catchError(
                                                                    (error) =>
                                                                        print(
                                                                            "Failed to update user: $error"));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
              }).toList(),
            );
          },
        ));
  }
}
