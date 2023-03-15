import 'package:flutter/material.dart';

class Utils {
  // COLORS

  static Color baseColor1 = Color(0xff11151e);
  static Color baseColor2 = Color(0xffffffff);

  static Color primaryDefault = Color(0xff001767);
  static Color primaryDark600 = Color(0xff001158);
  static Color primaryDark700 = Color(0xff000d4a);
  static Color primaryDark800 = Color(0xff00093b);
  static Color primaryDark900 = Color(0xff000631);

  static Color primaryLight50 = Color(0xffe1e9fa);
  static Color primaryLight100 = Color(0xffc5d5f7);
  static Color primaryLight200 = Color(0xff8fabef);
  static Color primaryLight300 = Color(0xff5375d1);
  static Color primaryLight400 = Color(0xff2847a3);

  static Color nonAktif = Color(0xff868FA0);
  static Color greyLight300 = Color(0xffBCC2CE);
  static Color greyLight100 = Color(0xffE9EDF5);
  static Color greyLight50 = Color(0xffF8FAFF);

  // SIZE
  static double verySmall = 6.0;
  static double small = 10.0;
  static double normal = 12.0;
  static double semiMedium = 14.0;
  static double medium = 16.0;
  static double large = 20.0;
  static double extraLarge = 24.0;

  // BORDER RADIUS
  static BorderRadius borderStyle1 = BorderRadius.only(
      topLeft: Radius.circular(6),
      topRight: Radius.circular(6),
      bottomLeft: Radius.circular(6),
      bottomRight: Radius.circular(6));

  static BorderRadius borderStyle2 = BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8));

  static BorderRadius borderStyle3 = BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
      bottomLeft: Radius.circular(16),
      bottomRight: Radius.circular(16));
}
