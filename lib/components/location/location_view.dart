import 'package:aplikasi_sederhana1/components/location/location_controller.dart';
import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/button.dart';
import 'package:aplikasi_sederhana1/widget/card_custom.dart';

import 'package:aplikasi_sederhana1/widget/main_widget.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:aplikasi_sederhana1/widget/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LocationView extends StatefulWidget {
  @override
  _LocationViewState createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  var controller = Get.put(LocationController());

  @override
  void initState() {
    controller.startLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "appbar",
        colorSafeArea: Utils.baseColor2,
        colorBackground: Utils.baseColor2,
        returnOnWillpop: true,
        backFunction: () {
          Get.back();
        },
        ontapAppbar: () {
          Get.back();
        },
        appbarTitle: "My Location",
        content: Obx(
          () => Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                informasiScreen(),
                SizedBox(
                  height: Utils.medium,
                ),
                SizedBox(
                  width: 200,
                  child: InkWell(
                    onTap: () => controller.checkFakeGps(),
                    child: CardCustom(
                      colorBg: Utils.primaryDefault,
                      radiusBorder: Utils.borderStyle1,
                      widgetCardCustom: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextLabel(
                            text: "Refresh Lokasi",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget informasiScreen() {
    return controller.prosesRefresh.value == true
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 3,
                color: Utils.primaryDefault,
              ),
              SizedBox(
                height: Utils.semiMedium,
              ),
              TextLabel(
                text: "Sedang Proses...",
                weigh: FontWeight.bold,
              )
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextLabel(
                text: "${controller.informasiLogin[0].username ?? ''}",
                size: Utils.medium,
                align: TextAlign.center,
                weigh: FontWeight.bold,
              ),
              SizedBox(
                height: Utils.semiMedium,
              ),
              TextLabel(
                text: "${controller.latLangLokasi.value}",
                align: TextAlign.center,
              ),
              SizedBox(
                height: Utils.semiMedium,
              ),
              TextLabel(
                text: "${controller.alamatLokasi.value}",
                align: TextAlign.center,
              ),
            ],
          );
  }
}
