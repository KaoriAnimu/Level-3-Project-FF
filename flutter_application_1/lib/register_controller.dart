import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pesan.dart';
import 'package:flutter_application_1/user_model.dart';
import 'package:flutter_application_1/user_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class registerController extends GetxController {
  static registerController get instance => Get.find();

  final email = TextEditingController();
  final nama = TextEditingController();
  final kota = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser();
    Get.to(() => homePage());
  }

  Future registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
