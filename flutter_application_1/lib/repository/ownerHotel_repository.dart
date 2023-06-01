import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';

class ownerHotelRepository extends GetxController {
  static ownerHotelRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createPesan(ownerHotel_Model user) async {
    await _db
        .collection("Hotel")
        .add(user.toJson())
        .whenComplete(
            () => Get.snackbar("Success", "Hotel anda berhasil ditambahkan"))
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again");
    });
  }

  Future<void> updateUser(ownerHotel_Model user, String document) {
    return _db
        .collection("Hotel")
        .doc(document)
        .update(user.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
