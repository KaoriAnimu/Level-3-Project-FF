import 'package:cloud_firestore/cloud_firestore.dart';
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
}
