
import 'package:flutter/material.dart';
import 'package:my_news_app/modles/category_modle.dart';
import 'package:my_news_app/widgets/my_category_card.dart';



class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<CategoryModle> category_list = const [
    CategoryModle(Name: 'Business', image: 'assets/business.jpeg'),
    CategoryModle(Name: 'Entertainment', image: 'assets/entertainment.jpg'),
    CategoryModle(Name: 'General', image: 'assets/general.jpg'),
    CategoryModle(Name: 'Health', image: 'assets/health.jpg'),
    CategoryModle(Name: 'Science', image: 'assets/science.jpg'),
    CategoryModle(Name: 'Sports', image: 'assets/sports.jpg'),
  ];

  late PageController pageController;

  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.6);
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: pageController,
        itemCount: category_list.length,
        itemBuilder: (context, index) {
          final isFocused = index == currentPage.round();
          return MyCategoryCard(
            categoryModle: category_list[index],
            isFocused: isFocused,
          );
        },
      ),
    );
  }
}









// class CategoryList extends StatefulWidget {
//   const CategoryList({super.key});

//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }

// class _CategoryListState extends State<CategoryList> {
// final List<CategoryModle>category_list=const[
//   CategoryModle(Name: 'Business', image: 'assets/business.jpeg'),
//   CategoryModle(Name: 'Entertainment', image: 'assets/entertainment.jpg'),
//   CategoryModle(Name: 'General', image: 'assets/general.jpg.jpeg'),
//   CategoryModle(Name: 'Health', image: 'assets/health.jpg'),
//   CategoryModle(Name: 'Science', image: 'assets/science.jpg'),
//   CategoryModle(Name: 'Sports', image: 'assets/sports.jpg'),
// ];

// late PageController pageController;

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pageController=PageController(viewportFraction: .5);
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 250,
//       child: PageView.builder(
//         //scrollDirection: Axis.horizontal,
//         clipBehavior: Clip.none,
//         controller: pageController,
//         itemCount:category_list.length,
        
//         itemBuilder: (context, index) {
//             return MyCategoryCard(categoryModle:category_list[index]);
//           })
//     );
//   }
// }