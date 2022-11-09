import 'package:askbefore_web_app/const/app_color.dart';
import 'package:askbefore_web_app/const/botton/elevatedBotton.dart';
import 'package:askbefore_web_app/const/botton/outlineBotton.dart';
import 'package:askbefore_web_app/const/gaping.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../const/app_string.dart';


class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int currentIndex = 0;
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
                Image.asset(AppString.logoUrl, scale: 2),
                outlinedButton(
                  AppString.topRightBottontext,
                  width: Get.width * 0.4,
                  onpress: _launchUrl, onPress: () {  },
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
                      fontSize: 16,
                      color: AppColor.cyan,
                      letterSpacing: 1.3),
                ),
              ),
            ),
            Tooltip(
              margin: EdgeInsets.only(left: 280),
              verticalOffset: 140,
              height: 40,
              preferBelow: false,
              decoration: BoxDecoration(
                  color: AppColor.cyan
                  ,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              message: ' Copy Text ',
              child: Card(
                elevation: 3,
                shape: StadiumBorder(),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: Get.width * 0.9,
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(30),
                      
                      ),
                  child: Center(
                      child: AppString.cardText.length > currentIndex
                          ? AutoSizeText(
                              AppString.cardText[currentIndex],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Trajan Pro',
                                  fontSize: 50,
                                  color: AppColor.cyan),
                            )
                          : AutoSizeText(
                              AppString.cardText[0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Trajan Pro',
                                  fontSize: 50,
                                  color: AppColor.cyan),
                            )),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            elevatedButton('Copy this question'),
            Gaping.devider,
            outlinedButton(
              'Try another one',
              iconData: Icons.hardware,
              width: Get.width * 0.50,
              onpress: () {
                setState(() {
                  currentIndex++;
                  if (currentIndex == AppString.cardText.length) {
                    Fluttertoast.showToast(
                        msg: 'List Finished', webPosition: 'center');
                  }
                });
              }, onPress: () {  },
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