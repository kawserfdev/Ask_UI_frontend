import 'package:askbefore_web_app/UI/Views/mobileView.dart';
import 'package:askbefore_web_app/UI/Views/webView.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 690) {
            return MobileView();
          } else if (constraints.maxWidth < 960) {
            return Webview();
          } else {
            return Webview();
          }
        },
      ),
    );
  }
}
