import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/details_articales_screen.dart';
import 'package:news_app/home/widget/tap_item.dart';
import 'package:news_app/model/articlas_response.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

// ignore: must_be_immutable
class TapContainer extends StatefulWidget {
  TapContainer({super.key, required this.sourcesList});
  List<Sources> sourcesList;

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList
                .map(
                  (source) => TapItem(
                    source: source,
                    isCleated:
                        selectedIndex == widget.sourcesList.indexOf(source),
                  ),
                )
                .toList(),
          ),
          FutureBuilder<ArticlesResponse>(
            future: Api.getNewsArticle(
                widget.sourcesList[selectedIndex].id ?? "abc-news"),
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
              var articleList = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) =>
                      _imageNetworkWidget(article: articleList[index]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _imageNetworkWidget extends StatelessWidget {
  const _imageNetworkWidget({
    super.key,
    required this.article,
  });

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsArticlesScreen(article: article),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CachedNetworkImage(
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
                fit: BoxFit.fill,
              ),
            ),
            Text(
              article.author ?? "Loading...,",
              style: GoogleFonts.exo(fontSize: 20, color: Colors.grey),
            ),
            Text(
              article.title ?? "Loading...,",
              style: GoogleFonts.exo(fontSize: 20, color: Colors.white),
            ),
            Text(
              article.publishedAt != null
                  ? timeago.format(DateTime.parse(article.publishedAt!))
                  : "Loading...",
              style: GoogleFonts.exo(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
    );
  }
}
