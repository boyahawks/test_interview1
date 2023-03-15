import 'dart:convert';

class SubjectModel {
  String? namaPelajaran;
  String? deskripsi;
  int? sks;

  SubjectModel({
    this.namaPelajaran,
    this.deskripsi,
    this.sks,
  });

  Map<String, dynamic> toMap() {
    return {
      "namaPelajaran": namaPelajaran,
      "deskripsi": deskripsi,
      "sks": sks,
    };
  }

  factory SubjectModel.fromMap(Map<String, dynamic> map) {
    return SubjectModel(
      namaPelajaran: map['namaPelajaran'],
      deskripsi: map['deskripsi'],
      sks: map['sks'],
    );
  }

  String toJson() => json.encode(toMap());
}
