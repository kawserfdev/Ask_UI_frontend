import 'package:askbefore_web_app/const/app_color.dart';
import 'package:flutter/material.dart';

Widget outlinedButton(String title,
    {IconData? iconData,
    required double width,
    required VoidCallback onPress,
    required onpress}) {
  return SizedBox(
    height: 40,
    width: width,
    child: OutlinedButton(
      onPressed: onPress,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColor.cyan,
            ),
            Text(
              title,
              style: TextStyle(color: AppColor.cyan),
            )
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 2.5, color: AppColor.cyan),
        shape: StadiumBorder(),
      ),
    ),
  );
}
