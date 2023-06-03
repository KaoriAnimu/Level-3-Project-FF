import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Order/codeTransaksi.dart';

class pesanan extends StatefulWidget {
  @override
  State<pesanan> createState() => _pesanan();
}

class _pesanan extends State<pesanan> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection(
          'pesan',
        )
        .where('email', isEqualTo: user.email)
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesanan Anda'),
          automaticallyImplyLeading: false,
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
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => codePembayaran(
                                code: data['code'],
                              )),
                    );
                  },
                  title: Text('${data['code']}'),
                  subtitle: Text('${data['total']}'),
                );
              }).toList(),
            );
          },
        ));
  }
}
