import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/articlas_response.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailsArticlesScreen extends StatelessWidget {
  const DetailsArticlesScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColor.pBarcolor,
        title: Text(
          article.source?.name ?? "ABC News",
          style: GoogleFonts.exo(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: article.urlToImage ?? "",
                placeholder: (context, url) => const SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.replay_circle_filled_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              article.title ?? "Loading...,",
              style: GoogleFonts.exo(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              article.description ?? "Loading...,",
              style: GoogleFonts.exo(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.content ?? "Loading...,",
              style: GoogleFonts.exo(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              article.publishedAt != null
                  ? timeago.format(DateTime.parse(article.publishedAt!))
                  : "Loading...",
              style: GoogleFonts.exo(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        color: AppColor.pBarcolor,
        onPressed: () {},
        child: Text(
          "View Full Article",
          style: GoogleFonts.exo(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
