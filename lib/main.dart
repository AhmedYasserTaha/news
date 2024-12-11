import 'package:flutter/material.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/splash_screen.dart';

void main() async {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryFragment(),
    );
  }
}
