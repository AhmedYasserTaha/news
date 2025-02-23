import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/home/web_view_screen.dart';
import 'package:news_app/model/articlas_response.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailsArticlesScreen extends StatelessWidget {
  const DetailsArticlesScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // الحصول على حجم الشاشة

    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColor.pBarcolor,
        title: Text(
          article.source?.name ?? "Category",
          style: GoogleFonts.exo(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        // يساعد في ضبط العناصر على جميع الشاشات
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height *
                      0.4, // تحديد ارتفاع الصورة بناءً على حجم الشاشة
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover, // ضبط الصورة لتتناسب مع الأبعاد
                    imageUrl: article.urlToImage ?? "",
                    placeholder: (context, url) => SizedBox(
                      height: size.height * 0.3,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  article.title ?? "No Title Available",
                  style: GoogleFonts.exo(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  article.description ?? "No description available",
                  style: GoogleFonts.exo(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                Text(
                  article.content ?? "No content available",
                  style: GoogleFonts.exo(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                Text(
                  article.publishedAt != null
                      ? timeago.format(DateTime.parse(article.publishedAt!))
                      : "No Date Available",
                  style: GoogleFonts.exo(fontSize: 16, color: Colors.grey[300]),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft, // تحريك الزر إلى الجهة اليسرى
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 16, left: 16), // إزاحة من الأسفل واليسار
          child: FloatingActionButton.extended(
            backgroundColor: AppColor.pBarcolor,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WebViewScreen(
                    url: article.url ??
                        "https://abcnews.go.com/Business/bitcoin-races-past-100000-dollars-fueled-post-election-rally/story?id=116127616",
                  ),
                ),
              );
            },
            label: Text(
              "View Full Article",
              style: GoogleFonts.exo(color: Colors.white, fontSize: 14),
            ),
            icon: const Icon(Icons.open_in_browser,
                color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}
