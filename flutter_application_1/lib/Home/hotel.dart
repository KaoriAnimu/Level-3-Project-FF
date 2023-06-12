import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/pesan.dart';
import 'package:get/get.dart';

class hotel extends StatefulWidget {
  final String documentId, path;
  hotel({Key? key, required this.documentId, required this.path})
      : super(key: key);
  @override
  State<hotel> createState() => _hotel(documentId: documentId, path: path);
}

class _hotel extends State<hotel> {
  final String documentId;
  String path;
  _hotel({Key? key, required this.documentId, required this.path});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection(path);
    return Scaffold(
        appBar: AppBar(
          title: Text('Hotel Ibis'),
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
                child: Column(mainAxisSize: MainAxisSize.max, children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Container(
                      width: 400,
                      height: 236.6,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.01, -0.15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                data['gambar'],
                                width: 208.1,
                                height: 208.4,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Align(
                              alignment: AlignmentDirectional(0.81, 0.08),
                              child: IconButton(
                                icon: Icon(Icons.navigate_next),
                                onPressed: () {},
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Container(
                      width: 431.8,
                      height: 295.3,
                      child: Align(
                        alignment: AlignmentDirectional(-0.7, -0.35),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '${data['nama']}',
                              ),
                              Divider(
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Deskripsi',
                                    ),
                                    TextButton(
                                      child: Text(
                                        'Lihat \nSelengkapnya',
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25, 15, 25, 0),
                                child: Text(
                                  '${data['deskripsi']}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: TextButton(
                        child: Text(
                          'Pesan',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFF0000),
                        ),
                        onPressed: () {
                          Get.to(() => pesanPenginapan(
                                documentId: documentId,
                                path: path,
                              ));
                        },
                      ),
                    ),
                  ),
                ]),
              );
            }

            return Text("loading");
          },
        ));
  }
}
