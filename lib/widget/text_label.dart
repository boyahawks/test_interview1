import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String? text;
  final TextAlign? align;
  final TextDecoration? decoration;
  final Color? color;
  final double? size;
  final FontWeight? weigh;
  final double? height;
  const TextLabel(
      {super.key,
      required this.text,
      this.align,
      this.decoration,
      this.color,
      this.size,
      this.weigh,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        decoration: decoration ?? TextDecoration.none,
        color: color ?? Colors.black,
        fontSize: size ?? 14,
        fontWeight: weigh ?? FontWeight.w500,
        height: height ?? 1.2,
      ),
    );
  }
}
