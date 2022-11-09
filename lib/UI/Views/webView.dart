import 'package:askbefore_web_app/const/app_color.dart';
import 'package:askbefore_web_app/const/botton/elevatedBotton.dart';
import 'package:askbefore_web_app/const/botton/outlineBotton.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const/app_string.dart';

class Webview extends StatelessWidget {
  final buttonWidth = Get.width * 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppString.logoUrl, scale: 1.5),
                outlinedButton(
                  AppString.topRightBottontext,
                  width: buttonWidth,
                  onPress: _launchUrl, onpress: _launchUrl(),
                )
              ],
            ),
            Container(
              height: Get.height * 0.150,
              width: double.maxFinite,
              child: Center(
                child: Text(
                  AppString.titleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16, color: AppColor.cyan, letterSpacing: 1.3),
                ),
              ),
            ),
            Card(
              elevation: 3,
              shape: StadiumBorder(),
              child: Container(
                padding: EdgeInsets.all(20),
                width: Get.width * 0.5,
                height: Get.height * 0.4,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: AutoSizeText(
                  AppString.cardText[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Trajan Pro',
                      fontSize: 50,
                      color: AppColor.cyan),
                )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: Get.width * 0.20,
                    child: elevatedButton('Copy this question')),
                SizedBox(
                  width: Get.width * 0.060,
                ),
                SizedBox(
                    width: Get.width * 0.20,
                    child: outlinedButton(
                      'Try another one',
                      iconData: Icons.hardware,
                      width: Get.width * 0.50,
                      onpress: () {
                        _launchUrl();
                      }, onPress: () {  },
                    ))
              ],
            ),
            Spacer(),
            FittedBox(
                child: TextButton(
              onPressed: _launchUrl,
              child: Text(
                AppString.bottomCenterText,
                style: TextStyle(color: AppColor.cyan),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(AppString.webUrl)) {
      throw 'Could not launch ${AppString.webUrl}}';
    }
  }
}
