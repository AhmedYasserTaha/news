import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/search_screen.dart';
import 'package:news_app/home/widget/tap_continar.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.categoryId, required this.title});
  final String categoryId;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColor.pBarcolor,
        title: Text(
          title,
          style: GoogleFonts.exo(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<SoursResponse>(
        future: Api.getSours(categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Wrong",
                style: GoogleFonts.exo(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.pBarcolor,
              ),
            );
          }
          if (snapshot.data?.status != "ok") {
            return Center(
              child: Text(
                "Wrong",
                style: GoogleFonts.exo(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          var sourceList = snapshot.data?.sources ?? [];

          return TapContainer(sourcesList: sourceList);
        },
      ),
    );
  }
}
