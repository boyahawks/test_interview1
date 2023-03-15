import 'package:aplikasi_sederhana1/components/login/login_model.dart';
import 'package:aplikasi_sederhana1/components/subject/subject_view.dart';
import 'package:aplikasi_sederhana1/utility/app_data.dart';
import 'package:aplikasi_sederhana1/utility/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = TextEditingController().obs;
  var password = TextEditingController().obs;

  var showPassword = false.obs;

  void startLoad() {
    username.value.text = "admin";
    password.value.text = "123456";
  }

  void validasiLogin() async {
    if (username.value.text == "" || password.value.text == "") {
      ToastNotif.showToast("Harap lengkapi form terlebih dahulu");
    } else if (username.value.text != "admin" ||
        password.value.text != "123456") {
      ToastNotif.showToast("Kombinasi username dan password salah");
    } else {
      List<LoginModel> informasiLogin = [];
      informasiLogin.add(LoginModel(username: "admin", password: "123456"));
      AppData.informasiLogin = informasiLogin;
      Get.offAll(SubjectView());
    }
  }
}
