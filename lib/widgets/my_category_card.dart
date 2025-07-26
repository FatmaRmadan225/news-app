import 'package:flutter/material.dart';
import 'package:my_news_app/modles/category_modle.dart';
import 'package:my_news_app/views/cat_view.dart';

class MyCategoryCard extends StatelessWidget {
  const MyCategoryCard({
    super.key,
    required this.categoryModle,
    required this.isFocused,
  });

  final CategoryModle categoryModle;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CatView(category: categoryModle.Name),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height:isFocused? 250:100,
          width: isFocused ? 200 : 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    )
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  categoryModle.image,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  categoryModle.Name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}