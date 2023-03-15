import 'package:aplikasi_sederhana1/components/login/login_controller.dart';
import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/button.dart';
import 'package:aplikasi_sederhana1/widget/card_custom.dart';
import 'package:aplikasi_sederhana1/widget/main_widget.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:aplikasi_sederhana1/widget/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var controller = Get.put(LoginController());

  @override
  void initState() {
    controller.startLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        type: "default",
        colorSafeArea: Utils.baseColor2,
        colorBackground: Utils.baseColor2,
        returnOnWillpop: false,
        content: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Utils.large,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextLabel(
                    text: "LOGIN",
                    size: Utils.large,
                    weigh: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Utils.large,
                ),
                CardCustomShadow(
                  colorBg: Utils.baseColor2,
                  radiusBorder: Utils.borderStyle1,
                  widgetCardCustom: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextLabel(
                            text: "Username",
                            size: 14.0,
                            weigh: FontWeight.bold,
                            color: Utils.primaryDefault,
                          ),
                          SizedBox(
                            height: Utils.verySmall,
                          ),
                          TextFieldMain(
                              statusIconLeft: true,
                              iconLeft: const Icon(
                                Iconsax.user_add,
                                color: Color.fromARGB(255, 3, 34, 60),
                              ),
                              controller: controller.username.value,
                              colorTextField: Utils.primaryDefault,
                              onTap: () {}),
                          SizedBox(
                            height: Utils.medium,
                          ),
                          TextLabel(
                            text: "Password",
                            size: 14.0,
                            weigh: FontWeight.bold,
                            color: Utils.primaryDefault,
                          ),
                          SizedBox(
                            height: Utils.verySmall,
                          ),
                          TextFieldPassword(
                            obscureController: controller.showPassword.value,
                            controller: controller.password.value,
                            colorTextField: Utils.primaryDefault,
                            onTapIconShow: () {
                              setState(() {
                                controller.showPassword.value =
                                    !controller.showPassword.value;
                              });
                            },
                            onTap: () {},
                          ),
                          SizedBox(
                            height: Utils.large,
                          ),
                          Button1(
                            textBtn: "Masuk",
                            style: 1,
                            colorBtn: Utils.primaryDefault,
                            colorText: Utils.baseColor2,
                            onTap: () {
                              controller.validasiLogin();
                            },
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
