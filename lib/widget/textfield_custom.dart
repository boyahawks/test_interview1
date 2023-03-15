import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldMain extends StatelessWidget {
  final Color? colorCard;
  final Color? colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final int? maxHeight;
  final bool? statusIconLeft;
  final Icon? iconLeft;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function? onTap;
  const TextFieldMain({
    super.key,
    this.colorCard,
    this.heightCard,
    this.iconLeft,
    this.maxHeight,
    required this.statusIconLeft,
    this.borderRadius,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    this.keyboardType,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardCustomForm(
      colorBg: colorCard ?? Utils.baseColor2,
      tinggiCard: heightCard ?? 45.0,
      radiusBorder: borderRadius ?? Utils.borderStyle1,
      widgetCardForm: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Utils.primaryDefault,
          controller: controller,
          textInputAction: TextInputAction.done,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: statusIconLeft == false
              ? const InputDecoration(
                  border: InputBorder.none,
                )
              : InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: iconLeft,
                ),
          style: TextStyle(
              fontSize: fontSize ?? 14.0,
              height: heightTextField ?? 2.0,
              color: colorTextField ?? Colors.black),
        ),
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final Color? colorCard;
  final Color? colorTextField;
  final double? heightCard;
  final double? fontSize;
  final double? heightTextField;
  final BorderRadius? borderRadius;
  final bool? obscureController;
  final TextEditingController? controller;
  final Function? onTap;
  final Function? onTapIconShow;
  const TextFieldPassword({
    super.key,
    this.colorCard,
    this.heightCard,
    this.borderRadius,
    this.fontSize,
    this.heightTextField,
    this.colorTextField,
    required this.obscureController,
    required this.controller,
    required this.onTap,
    required this.onTapIconShow,
  });

  @override
  Widget build(BuildContext context) {
    return CardCustomForm(
      colorBg: colorCard ?? Utils.baseColor2,
      tinggiCard: heightCard ?? 50.0,
      radiusBorder: borderRadius ?? Utils.borderStyle1,
      widgetCardForm: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Utils.primaryDefault,
          obscureText: !obscureController!,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                Iconsax.lock,
                color: Color.fromARGB(255, 3, 34, 60),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureController! ? Iconsax.eye : Iconsax.eye_slash,
                  color: obscureController!
                      ? Color.fromARGB(255, 3, 34, 60)
                      : Utils.nonAktif,
                ),
                onPressed: () {
                  if (onTapIconShow != null) onTapIconShow!();
                },
              )),
          onSubmitted: (value) {
            if (onTap != null) onTap!();
          },
          style: TextStyle(
              fontSize: fontSize ?? 14.0,
              height: heightTextField ?? 2.0,
              color: colorTextField ?? Colors.black),
        ),
      ),
    );
  }
}
