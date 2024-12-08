import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        backgroundColor: AppColor.pBarcolor,
      ),
      body: Column(),
    );
  }
}
