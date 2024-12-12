import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(category.codeColor!),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25))),
      child: Column(children: [
        const Spacer(),
        Image.asset(
          category.imageAssets!,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        const Spacer(),
        Text(
          category.title!,
          style: GoogleFonts.exo(fontSize: 22, color: Colors.white),
        ),
        const Gap(15),
      ]),
    );
  }
}
