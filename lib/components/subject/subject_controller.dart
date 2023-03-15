import 'package:aplikasi_sederhana1/components/login/login_view.dart';
import 'package:aplikasi_sederhana1/components/master/buttom_sheet.dart';
import 'package:aplikasi_sederhana1/components/subject/subject_model.dart';
import 'package:aplikasi_sederhana1/utility/app_data.dart';
import 'package:aplikasi_sederhana1/utility/toast.dart';
import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/button.dart';
import 'package:aplikasi_sederhana1/widget/modal_popup.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:aplikasi_sederhana1/widget/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectController extends GetxController {
  var listSubject = <SubjectModel>[].obs;

  var namaPelajaran = TextEditingController().obs;
  var deskripsiPelajaran = TextEditingController().obs;
  var sksPelajaran = TextEditingController().obs;

  var statusEditUpdate = false.obs;

  var indexEdit = 0.obs;

  void startLoad() {
    prosesGetMataPelajaran();
  }

  Future<bool> prosesGetMataPelajaran() {
    List<SubjectModel> tampungData = AppData.listMataPelajaran ?? [];

    if (tampungData.isNotEmpty) {
      List<SubjectModel> tampungMataPelajaran = AppData.listMataPelajaran!;

      if (tampungMataPelajaran.isNotEmpty) {
        listSubject.value = tampungMataPelajaran;
        listSubject.refresh();
      }
    }

    return Future.value(true);
  }

  void validasiAksi(index, dataSelected) {
    ButtonSheetController().showButtonSheet(
        "",
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 3),
                child: Button1(
                  textBtn: "Hapus Data",
                  colorBtn: Colors.red,
                  colorText: Utils.baseColor2,
                  style: 1,
                  onTap: () {
                    ButtonSheetController().showButtonSheet(
                        "Hapus Data",
                        TextLabel(
                            text:
                                "Yakin hapus data ${dataSelected.namaPelajaran} ?"),
                        "",
                        "Hapus", () {
                      listSubject.removeWhere((element) =>
                          element.namaPelajaran == dataSelected.namaPelajaran);
                      listSubject.refresh();
                      ToastNotif.showToast("Data Berhasil di hapus");
                      Get.back();
                      Get.back();
                      refreshDataMateri();
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Button1(
                  textBtn: "Update Data",
                  colorBtn: Utils.primaryDefault,
                  colorText: Utils.baseColor2,
                  style: 1,
                  onTap: () {
                    Get.back();
                    indexEdit.value = index;
                    indexEdit.refresh();
                    namaPelajaran.value.text = dataSelected.namaPelajaran;
                    deskripsiPelajaran.value.text = dataSelected.deskripsi;
                    sksPelajaran.value.text = dataSelected.sks.toString();
                    tambahEditData(true);
                  },
                ),
              ),
            )
          ],
        ),
        "nobutton",
        "",
        () {});
  }

  void tambahEditData(type) {
    statusEditUpdate.value = type;
    statusEditUpdate.refresh();

    String judul = !type ? "Tambah Data" : "Update Data";
    String aksiButton = !type ? "Tambah" : "Update";

    ButtonSheetController()
        .showButtonSheet(judul, formTambahData(), "", aksiButton, () {
      if (namaPelajaran.value.text == "" ||
          deskripsiPelajaran.value.text == "" ||
          sksPelajaran.value.text == "") {
        ToastNotif.showToast("Harap lengkapi form terlebih dahulu");
      } else {
        if (!type) {
          listSubject.add(SubjectModel(
            namaPelajaran: namaPelajaran.value.text,
            deskripsi: deskripsiPelajaran.value.text,
            sks: int.parse(sksPelajaran.value.text),
          ));
          listSubject.refresh();
          ToastNotif.showToast("Berhasil tambah data");
          Get.back();
          refreshDataMateri();
        } else {
          SubjectModel updateData = SubjectModel(
              namaPelajaran: namaPelajaran.value.text,
              deskripsi: deskripsiPelajaran.value.text,
              sks: int.parse(sksPelajaran.value.text));

          listSubject[indexEdit.value] = updateData;
          ToastNotif.showToast("Berhasil update data");
          listSubject.refresh();
          Get.back();
          refreshDataMateri();
        }
      }
    });
  }

  void refreshDataMateri() {
    AppData.listMataPelajaran = listSubject;
    namaPelajaran.value.text = "";
    namaPelajaran.refresh();
    deskripsiPelajaran.value.text = "";
    deskripsiPelajaran.refresh();
    sksPelajaran.value.text = "";
    sksPelajaran.refresh();
    indexEdit.value = 0;
    indexEdit.refresh();
  }

  Widget formTambahData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Utils.normal,
        ),
        TextLabel(
          text: "Nama Pelajaran",
          color: Utils.primaryDefault,
        ),
        SizedBox(
          height: Utils.verySmall,
        ),
        TextFieldMain(
            statusIconLeft: false,
            controller: namaPelajaran.value,
            colorTextField: Utils.primaryDefault,
            onTap: () {}),
        SizedBox(
          height: Utils.medium,
        ),
        TextLabel(
          text: "Deskrisi Pelajaran",
          color: Utils.primaryDefault,
        ),
        SizedBox(
          height: Utils.verySmall,
        ),
        TextFieldMain(
            statusIconLeft: false,
            controller: deskripsiPelajaran.value,
            colorTextField: Utils.primaryDefault,
            onTap: () {}),
        SizedBox(
          height: Utils.medium,
        ),
        TextLabel(
          text: "Sks Pelajaran",
          color: Utils.primaryDefault,
        ),
        SizedBox(
          height: Utils.verySmall,
        ),
        TextFieldMain(
            statusIconLeft: false,
            keyboardType: TextInputType.number,
            controller: sksPelajaran.value,
            colorTextField: Utils.primaryDefault,
            onTap: () {}),
        SizedBox(
          height: Utils.medium,
        ),
      ],
    );
  }

  void logout() {
    showGeneralDialog(
      barrierDismissible: false,
      context: Get.context!,
      barrierColor: Colors.black54, // space around dialog
      transitionDuration: Duration(milliseconds: 200),
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
              parent: a1,
              curve: Curves.elasticOut,
              reverseCurve: Curves.easeOutCubic),
          child: ModalPopup(
            // our custom dialog
            title: "Peringatan",
            content: "Yakin Keluar Akun",
            positiveBtnText: "Keluar",
            negativeBtnText: "Kembali",
            style: 1,
            buttonStatus: 1,
            positiveBtnPressed: () {
              AppData.informasiLogin = null;
              Get.offAll(LoginView());
            },
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return null!;
      },
    );
  }
}
