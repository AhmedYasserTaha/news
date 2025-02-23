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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
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
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<SoursResponse>(
          future: Api.getSours(categoryId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.pBarcolor,
                ),
              );
            }
            if (snapshot.hasError || snapshot.data?.status != "ok") {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error, color: Colors.red, size: 50),
                    const SizedBox(height: 10),
                    Text(
                      "Failed to load data",
                      style: GoogleFonts.exo(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            var sourceList = snapshot.data?.sources ?? [];

            return sourceList.isNotEmpty
                ? TapContainer(sourcesList: sourceList)
                : Center(
                    child: Text(
                      "No sources available",
                      style: GoogleFonts.exo(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
