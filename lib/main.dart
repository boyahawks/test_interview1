import 'package:aplikasi_sederhana1/components/login/login_view.dart';
import 'package:aplikasi_sederhana1/utility/app_data.dart';
import 'package:aplikasi_sederhana1/utility/local_storage.dart';
import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/main_widget.dart';
import 'package:aplikasi_sederhana1/widget/text_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.prefs = await SharedPreferences.getInstance();
  // AppData.clearAllData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'APLIKASI SEDERHANA 1',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        supportedLocales: [
          Locale('en'),
        ],
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    routeToOnboard();
  }

  void routeToOnboard() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(LoginView());
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      type: "default",
      colorSafeArea: Utils.primaryDefault,
      colorBackground: Utils.primaryDefault,
      returnOnWillpop: false,
      content: Align(
          alignment: Alignment.center,
          child: TextLabel(
            text: "APLIKASI SEDERHANA",
            color: Utils.baseColor2,
            size: Utils.medium,
            align: TextAlign.center,
            weigh: FontWeight.bold,
          )),
    );
  }
}
