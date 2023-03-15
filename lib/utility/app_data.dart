import 'dart:convert';

import 'package:aplikasi_sederhana1/components/login/login_model.dart';
import 'package:aplikasi_sederhana1/components/subject/subject_model.dart';
import 'package:aplikasi_sederhana1/utility/local_storage.dart';

class AppData {
  // SET

  // LIST DATA
  static set informasiLogin(List<LoginModel>? value) {
    if (value != null) {
      List<String> listString = value.map((e) => e.toJson()).toList();
      LocalStorage.saveToDisk('informasiLogin', listString);
    } else {
      LocalStorage.saveToDisk('informasiLogin', null);
    }
  }

  static set listMataPelajaran(List<SubjectModel>? value) {
    if (value != null) {
      List<String> listString = value.map((e) => e.toJson()).toList();
      LocalStorage.saveToDisk('listMataPelajaran', listString);
    } else {
      LocalStorage.saveToDisk('listMataPelajaran', null);
    }
  }

  // GET

  // LIST DATA
  static List<LoginModel>? get informasiLogin {
    if (LocalStorage.getFromDisk('informasiLogin') != null) {
      List<String> listData = LocalStorage.getFromDisk('informasiLogin');
      return listData.map((e) => LoginModel.fromMap(jsonDecode(e))).toList();
    }
    return null;
  }

  static List<SubjectModel>? get listMataPelajaran {
    if (LocalStorage.getFromDisk('listMataPelajaran') != null) {
      List<String> listData = LocalStorage.getFromDisk('listMataPelajaran');
      return listData.map((e) => SubjectModel.fromMap(jsonDecode(e))).toList();
    }
    return null;
  }

  // CLEAR ALL DATA

  static void clearAllData() =>
      LocalStorage.removeFromDisk(null, clearAll: true);
}
