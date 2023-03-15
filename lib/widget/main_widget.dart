import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/appbar.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  final Color? colorSafeArea;
  final Color? colorBackground;
  final bool? returnOnWillpop;
  final String? type;
  final String? appbarTitle;
  final Widget? content;
  final Widget? contentBottom;
  final Function()? backFunction;
  final Function()? ontapAppbar;

  const MainScaffold({
    Key? key,
    required this.type,
    required this.content,
    this.colorSafeArea,
    this.colorBackground,
    this.returnOnWillpop,
    this.backFunction,
    this.appbarTitle,
    this.ontapAppbar,
    this.contentBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == "default"
        ? Container(
            color: colorSafeArea ?? Utils.baseColor2,
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: colorBackground ?? Utils.baseColor2,
                  body: WillPopScope(
                    onWillPop: () async {
                      if (backFunction != null) backFunction!();
                      return returnOnWillpop ?? false;
                    },
                    child: content!,
                  )),
            ),
          )
        : type == "appbar"
            ? Container(
                color: colorSafeArea ?? Utils.baseColor2,
                child: SafeArea(
                  child: Scaffold(
                      backgroundColor: colorBackground ?? Utils.baseColor2,
                      appBar: AppBar(
                          backgroundColor: Utils.baseColor2,
                          automaticallyImplyLeading: false,
                          elevation: 2,
                          flexibleSpace: AppbarMenu1(
                            title: appbarTitle ?? "",
                            icon: 1,
                            colorTitle: Colors.black,
                            onTap: () {
                              if (ontapAppbar != null) ontapAppbar!();
                            },
                          )),
                      body: WillPopScope(
                        onWillPop: () async {
                          if (backFunction != null) backFunction!();
                          return returnOnWillpop ?? false;
                        },
                        child: content!,
                      )),
                ),
              )
            : type == "appbar_with_bottom"
                ? Container(
                    color: colorSafeArea ?? Utils.baseColor2,
                    child: SafeArea(
                      child: Scaffold(
                          backgroundColor: colorBackground ?? Utils.baseColor2,
                          appBar: AppBar(
                              backgroundColor: Utils.baseColor2,
                              automaticallyImplyLeading: false,
                              elevation: 2,
                              flexibleSpace: AppbarMenu1(
                                title: appbarTitle ?? "",
                                icon: 1,
                                colorTitle: Colors.black,
                                onTap: () {
                                  if (ontapAppbar != null) ontapAppbar!();
                                },
                              )),
                          body: WillPopScope(
                            onWillPop: () async {
                              if (backFunction != null) backFunction!();
                              return returnOnWillpop ?? false;
                            },
                            child: content!,
                          ),
                          bottomNavigationBar: Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 12),
                            child: SizedBox(height: 50, child: contentBottom),
                          )),
                    ),
                  )
                : SizedBox();
  }
}
