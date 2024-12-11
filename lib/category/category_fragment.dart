import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/category/widget/category_iteam.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_color.dart';

class CategoryFragment extends StatefulWidget {
  CategoryFragment({super.key});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<CategoryModel>? categoryList;
  @override
  void initState() {
    super.initState();
    categoryList = CategoryModel().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pDcolor,
      appBar: AppBar(
        backgroundColor: AppColor.pBarcolor,
        title: Text(
          "NEWS APP",
          style: GoogleFonts.exo(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              "Pick your category \nof interest",
              style: GoogleFonts.exo(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const Gap(15),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(categoryId: categoryList![index].id!),
                        ),
                      );
                    },
                    child: CategoryItem(
                      category: categoryList![index],
                      index: index,
                    ),
                  );
                },
                itemCount: categoryList!.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
