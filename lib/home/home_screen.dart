import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/widget/tap_continar.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        backgroundColor: AppColor.pBarcolor,
        title: Text(
          "Sport",
          style: GoogleFonts.exo(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder<SoursResponse>(
        future: Api.getSours(),
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
            return Center(
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
          // return ListView.builder(
          //   itemBuilder: (context, index) => Text(
          //     sourceList[index].name ?? "",
          //     style: GoogleFonts.exo(color: Colors.white, fontSize: 18),
          //   ),
          //   itemCount: sourceList.length,
          // );

          return TapContainer(sourcesList: sourceList);
        },
      ),
    );
  }
}
