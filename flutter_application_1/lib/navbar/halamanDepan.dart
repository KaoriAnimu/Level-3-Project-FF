import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/hotel.dart';
import 'package:flutter_application_1/controller/ownerHotel_controller.dart';
import 'package:flutter_application_1/model/bookmark_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        .where('approve', isNotEqualTo: 'no')
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Travel Hub'),
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
            if (snapshot.hasData) {
              return Center(child: Text('Hotel kosong'));
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
