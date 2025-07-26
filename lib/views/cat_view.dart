import 'package:flutter/material.dart';
import 'package:my_news_app/modles/article_modle.dart';
import 'package:my_news_app/widgets/list_view_builder.dart';

class CatView extends StatelessWidget {
  const CatView({super.key,required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(backgroundColor: Color.fromARGB(249, 152, 28, 201),
      centerTitle: true,
      title: Text('$category News',style: TextStyle(color: Colors.white,fontSize: 24),),
      ),
      body: CustomScrollView(
        slivers: [
          ListViewBuilder(category: category)
        ],
      ),
    );
  }
}