import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/SettingsPage/HotelForOwner/ownerHotel.dart';

class listOwnerHotel extends StatefulWidget {
  @override
  State<listOwnerHotel> createState() => _listOwnerHotel();
}

class _listOwnerHotel extends State<listOwnerHotel> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final Stream<QuerySnapshot> users = FirebaseFirestore.instance
        .collection('Hotel')
        .where('email', isEqualTo: user.email)
        .snapshots();

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