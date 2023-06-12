import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/hotel.dart';
import 'package:get/get.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection(
          'Bookmark',
        )
        .where('email', isEqualTo: user.email)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text('Bookmark'),
          automaticallyImplyLeading: false,
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
              return Center(child: Text('Bookmark Kosong'));
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Hapus"),
                            content: Text("Hapus hotel pada bookmark?"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("Bookmark")
                                        .doc(document.id)
                                        .delete();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tidak'))
                            ],
                          );
                        });
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => hotel(
                                documentId: document.id,
                                path: 'Bookmark',
                              )),
                    );
                  },
                  title: Text('${data['nama']}'),
                  subtitle: Text('${data['alamat']}'),
                );
              }).toList(),
            );
          },
        ));
  }
}
