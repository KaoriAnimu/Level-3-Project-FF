import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/bookmark_model.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:flutter_application_1/repository/bookmark_repository.dart';
import 'package:flutter_application_1/repository/ownerHotel_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../SettingsPage/HotelForOwner/listHotelOwner.dart';

class ownerHotelController extends GetxController {
  static ownerHotelController get instance => Get.find();
  final user = FirebaseAuth.instance.currentUser!;
  final nama = TextEditingController();
  final alamat = TextEditingController();
  final fasilitas = TextEditingController();
  final harga = TextEditingController();
  final email = TextEditingController();
  final gambar = TextEditingController();
  final deskripsi = TextEditingController();

  final namaEdit = TextEditingController();
  final alamatEdit = TextEditingController();
  final fasilitasEdit = TextEditingController();
  final hargaEdit = TextEditingController();
  final gambarEdit = TextEditingController();
  final deskripsiEdit = TextEditingController();

  final ownerHotelRepo = Get.put(ownerHotelRepository());
  final bookmarkRepo = Get.put(BookmarkRepository());

  Future<void> createPesan(ownerHotel_Model user, BuildContext context) async {
    await ownerHotelRepo.createPesan(user);
    dialogDone(context);
  }

  Future<void> createBookmark(bookmark_Model user, BuildContext context) async {
    await bookmarkRepo.createUser(user);
    dialogDone(context);
  }

  Future<void> editPesan(
      ownerHotel_Model user, BuildContext context, String document) async {
    await ownerHotelRepo.updateUser(user, document);
    dialogUpdateDone(context);
  }

  void dialogDone(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Hotel anda berhasil ditambahkan"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content:
                                Text("Apakah anda ingin megelola hotel anda?"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ya')),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Tidak'))
                            ],
                          );
                        });
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }

  void dialogUpdateDone(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text("Hotel anda berhasil diubah"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
