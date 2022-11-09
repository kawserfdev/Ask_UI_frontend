import 'package:askbefore_web_app/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget elevatedButton(String title) {
  return SizedBox(
    height: 40,
    width: Get.width * 0.5,
    child: ElevatedButton(
        onHover: (Value) {},
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: AppColor.cyan),
        onPressed: () {},
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copy_rounded),
              Text(title),
            ],
          ),
        )),
  );
}
