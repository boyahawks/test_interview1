import 'package:aplikasi_sederhana1/utility/utils.dart';
import 'package:aplikasi_sederhana1/widget/card_custom.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchApp extends StatelessWidget {
  final bool? isFilter;
  final bool? onChange;
  final TextEditingController? controller;
  final Function? onTap;
  final Function? onTapFilter;
  // final controller, onTap, onChange, isSearchDate, isFilter, onTapFilter;
  const SearchApp({
    super.key,
    this.isFilter,
    required this.controller,
    required this.onChange,
    this.onTap,
    this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: isFilter! == false ? 60 : 100,
          child: CardCustom(
            colorBg: Colors.white,
            radiusBorder: Utils.borderStyle1,
            widgetCardCustom: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 15,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Iconsax.search_normal_1,
                      size: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onChange == false
                              ? Expanded(
                                  flex: 80,
                                  child: TextField(
                                    controller: controller,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cari"),
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.5,
                                        color: Colors.black),
                                    onSubmitted: (value) {
                                      if (onTap != null) onTap!(value);
                                    },
                                  ),
                                )
                              : Expanded(
                                  flex: 80,
                                  child: TextField(
                                    controller: controller,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Cari"),
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        height: 1.5,
                                        color: Colors.black),
                                    onChanged: (value) {
                                      if (onTap != null) onTap!(value);
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        isFilter! == false
            ? SizedBox(
                width: 10,
              )
            : SizedBox(),
        isFilter! == false
            ? Expanded(
                flex: 10,
                child: InkWell(
                  onTap: () {
                    if (onTapFilter != null) onTapFilter!();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 211, 205, 205)),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, left: 1, right: 2),
                        child: Icon(Iconsax.setting_4)),
                  ),
                ))
            : SizedBox()
      ],
    );
    ;
  }
}
