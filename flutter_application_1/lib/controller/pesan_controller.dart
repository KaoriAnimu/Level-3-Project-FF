import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Order/codeTransaksi.dart';
import 'package:flutter_application_1/model/pesan_model.dart';
import 'package:flutter_application_1/repository/pesan_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class pesanController extends GetxController {
  static pesanController get instance => Get.find();
  final user = FirebaseAuth.instance.currentUser!;

  final namaHotel = TextEditingController();
  final dateIn = TextEditingController();
  final dateOut = TextEditingController();
  final total = TextEditingController();
  final code = TextEditingController();
  final email = TextEditingController();
  String codeQr = '';

  final pesanRepo = Get.put(pesanRepository());

  Future<void> createPesan(pesanModel user) async {
    await pesanRepo.createPesan(user);
    codeQr = code.text.toString();
    Get.to(() => codePembayaran(
          code: codeQr,
          harga: total.text,
        ));
  }
}
