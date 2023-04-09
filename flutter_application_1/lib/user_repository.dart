import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
            () => Get.snackbar("Succes", "You account has been created."))
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again");
    });
  }
}
