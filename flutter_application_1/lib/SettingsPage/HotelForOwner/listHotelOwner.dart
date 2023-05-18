import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SettingsPage/HotelForOwner/ownerHotel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

class listOwnerHotel extends StatefulWidget {
  @override
  State<listOwnerHotel> createState() => _listOwnerHotel();
}

class _listOwnerHotel extends State<listOwnerHotel> {
  List<Detail> details = [
    const Detail(
      title: 'Hotel 1',
      urlPict: '#',
    ),
    const Detail(
      title: 'Hotel 2',
      urlPict: '#',
    )
  ];

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('Hotel').snapshots();

    return Scaffold(
        appBar: AppBar(
          title: Text('Hotel Anda'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ownerHotel()),
                  );
                },
                icon: Icon(Icons.add))
          ],
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
                  title: Text('${data['nama']}'),
                  subtitle: Text('${data['alamat']}'),
                );
              }).toList(),
            );
          },
        ));
  }
}

class Detail {
  final String title;
  final String urlPict;

  const Detail({required this.title, required this.urlPict});
}

// ListView.builder(
//             itemCount: details.length,
//             itemBuilder: (context, index) {
//               final detail = details[index];

//               return Padding(
//                 padding: const EdgeInsets.only(top: 5),
//                 child: Card(
//                   child: ListTile(
//                     title: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Text(
//                         '${index + 1}. ${detail.title}',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     onTap: () {},
//                   ),
//                 ),
//               );
//             })