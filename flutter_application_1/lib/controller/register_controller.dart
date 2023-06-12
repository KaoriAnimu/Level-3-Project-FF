import 'package:flutter_application_1/model/user_model.dart';
import 'package:flutter_application_1/repository/user_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class registerController extends GetxController {
  static registerController get instance => Get.find();

  final email = TextEditingController();
  final nama = TextEditingController();
  final password = TextEditingController();
  final password2nd = TextEditingController();

  final namaEdit = TextEditingController();

  final namaOwner = TextEditingController();
  final emailOwner = TextEditingController();
  final approveOwner = TextEditingController();
  final ktpOwner = TextEditingController();
  final tlpOwner = TextEditingController();
  final alamatOwner = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

  Future<void> editPesan(UserModel user, String document) async {
    await userRepo.updateUser(user, document);
  }

  void dialogDone(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Success"),
            content: Text(
                "Akun anda berhasil ditambahkan, silahkan tunggu 2x24 jam."),
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
