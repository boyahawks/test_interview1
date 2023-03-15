import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ButtonSheetController extends GetxController {
  void showButtonSheet(String pesan1, Widget content, String type, String acc,
      Function() onTap) {
    showModalBottomSheet(
      context: Get.context!,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 90,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$pesan1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: InkWell(
                            onTap: () => Navigator.pop(Get.context!),
                            child: Icon(
                              Iconsax.close_circle,
                              color: Colors.red,
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Utils.small,
                  ),
                  Divider(),
                  SizedBox(
                    height: Utils.medium,
                  ),
                  content,
                  SizedBox(
                    height: Utils.medium,
                  ),
                  type == "nobutton"
                      ? SizedBox()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => Get.back(),
                                child: Button3(
                                  textBtn: "Batal",
                                  colorSideborder: Utils.primaryDefault,
                                  overlayColor: Utils.primaryLight100,
                                  colorText: Utils.primaryDefault,
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Button1(
                                  textBtn: acc,
                                  style: 2,
                                  colorBtn: Utils.primaryDefault,
                                  onTap: () {
                                    if (onTap != null) onTap();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
