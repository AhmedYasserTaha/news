import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/widget/tap_continar.dart';
import 'package:news_app/model/articlas_response.dart';
import 'package:news_app/utils/app_color.dart';

class Search extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(color: Colors.white, fontSize: 16);
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white)),
        ),
        scaffoldBackgroundColor: AppColor.pDcolor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.pBarcolor,
        ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.close,
          size: 30,
          color: Color.fromARGB(255, 255, 255, 255),
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<ArticlesResponse>(
      future: Api.getSearchNewsArticle(query),
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
              "Search Article",
              style: GoogleFonts.exo(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        var articleList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: articleList.length,
            itemBuilder: (context, index) =>
                imageNetworkWidget(article: articleList[index]),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
