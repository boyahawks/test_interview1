import 'package:aplikasi_sederhana1/components/location/location_view.dart';
import 'package:aplikasi_sederhana1/components/subject/subject_controller.dart';
import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/button.dart';
import 'package:aplikasi_sederhana1/widget/card_custom.dart';
import 'package:aplikasi_sederhana1/widget/main_widget.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:aplikasi_sederhana1/widget/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SubjectView extends StatefulWidget {
  @override
  _SubjectViewState createState() => _SubjectViewState();
}

class _SubjectViewState extends State<SubjectView> {
  var controller = Get.put(SubjectController());

  @override
  void initState() {
    controller.startLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "appbar_with_bottom",
        colorSafeArea: Utils.baseColor2,
        colorBackground: Utils.baseColor2,
        returnOnWillpop: false,
        backFunction: () {
          controller.logout();
        },
        ontapAppbar: () {
          controller.logout();
        },
        appbarTitle: "Mata Pelajaran",
        contentBottom: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 20,
              child: Padding(
                  padding: EdgeInsets.only(right: 3.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(LocationView(),
                          duration: Duration(milliseconds: 300),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: CardCustom(
                      colorBg: Utils.primaryDefault,
                      colorBorder: Utils.baseColor2,
                      radiusBorder: Utils.borderStyle1,
                      widgetCardCustom: const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Iconsax.location,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
            ),
            Expanded(
              flex: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Button1(
                  textBtn: "Tambah Data",
                  style: 1,
                  colorBtn: Utils.primaryDefault,
                  colorText: Utils.baseColor2,
                  onTap: () {
                    controller.tambahEditData(false);
                  },
                ),
              ),
            )
          ],
        ),
        content: Obx(
          () => Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: controller.listSubject.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: TextLabel(
                        text: "Data Pelajaran Kosong",
                        size: Utils.medium,
                        weigh: FontWeight.bold,
                        color: Utils.primaryDefault,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Utils.medium,
                        ),
                        Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listSubject.length,
                              itemBuilder: (context, index) {
                                var nama =
                                    controller.listSubject[index].namaPelajaran;
                                var deskripsi =
                                    controller.listSubject[index].deskripsi;
                                var sks = controller.listSubject[index].sks;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () => controller.validasiAksi(
                                          index, controller.listSubject[index]),
                                      child: CardCustom(
                                        colorBg: Utils.baseColor2,
                                        radiusBorder: Utils.borderStyle1,
                                        widgetCardCustom: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextLabel(
                                                text: "$nama",
                                                weigh: FontWeight.bold,
                                                color: Utils.primaryDefault,
                                              ),
                                              SizedBox(
                                                height: Utils.verySmall,
                                              ),
                                              TextLabel(
                                                text: "$deskripsi",
                                                color: Utils.primaryDefault,
                                              ),
                                              SizedBox(
                                                height: Utils.verySmall,
                                              ),
                                              TextLabel(
                                                text: "$sks SKS",
                                                color: Utils.primaryDefault,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.small,
                                    )
                                  ],
                                );
                              }),
                        ),
                      ],
                    )),
        ));
  }
}
