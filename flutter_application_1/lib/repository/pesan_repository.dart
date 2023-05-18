import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/pesan_model.dart';

class pesanRepository extends GetxController {
  static pesanRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createPesan(pesanModel user) async {
    await _db
        .collection("pesan")
        .add(user.toJson())
        .whenComplete(
            () => Get.snackbar("Success", "Pesanan kamu sudah diterima"))
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again");
    });
  }
}
