class CategoryModel {
  final String? id;
  final String? title;
  final String? imageAssets;
  final int? codeColor;

  CategoryModel({this.id, this.title, this.imageAssets, this.codeColor});

//business entertainment general health science sports technology
  List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          id: "sports",
          title: "Sports",
          imageAssets: "assets/images/sports.png",
          codeColor: 0xffC91C22),
      CategoryModel(
          id: "general",
          title: "General",
          imageAssets: "assets/images/politics.png",
          codeColor: 0xff003E90),
      CategoryModel(
          id: "health",
          title: "Health",
          imageAssets: "assets/images/health.png",
          codeColor: 0xffED1E79),
      CategoryModel(
          id: "business",
          title: "Business",
          imageAssets: "assets/images/bussines.png",
          codeColor: 0xffCF7E48),
      CategoryModel(
          id: "entertainment",
          title: "Entertainment",
          imageAssets: "assets/images/environment.png",
          codeColor: 0xff4882CF),
      CategoryModel(
          id: "science",
          title: "Science",
          imageAssets: "assets/images/science.png",
          codeColor: 0xffF2D352),
    ];
  }
}
