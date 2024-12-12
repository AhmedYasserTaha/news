import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_color.dart';

// ignore: must_be_immutable
class TapItem extends StatelessWidget {
  TapItem({super.key, required this.source, required this.isCleated});
  Sources source;
  bool isCleated;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.pBarcolor, width: 2),
          borderRadius: BorderRadius.circular(10),
          color: isCleated ? AppColor.pBarcolor : Colors.transparent),
      child: Text(
        source.name ?? "",
        textAlign: TextAlign.center,
        style: GoogleFonts.exo(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isCleated ? Colors.black : Colors.white),
      ),
    );
  }
}
