import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/bookmark_model.dart';
import 'package:flutter_application_1/model/ownerHotel_model.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/user_model.dart';

class BookmarkRepository extends GetxController {
  static BookmarkRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(bookmark_Model user) async {
    await _db
        .collection("bookmark")
        .add(user.toJson())
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
