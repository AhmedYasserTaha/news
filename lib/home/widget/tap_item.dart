import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_color.dart';

class TapItem extends StatelessWidget {
  TapItem({super.key, required this.source, required this.isCleated});
  Sources source;
  bool isCleated;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        source.name ?? "",
        textAlign: TextAlign.center,
        style: GoogleFonts.exo(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: isCleated ? Colors.black : Colors.white),
      ),
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.pBarcolor, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: isCleated ? AppColor.pBarcolor : Colors.transparent),
    );
  }
}
