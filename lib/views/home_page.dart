import 'package:flutter/material.dart';
import 'package:my_news_app/widgets/category_list.dart';
import 'package:my_news_app/widgets/list_view_builder.dart';
import 'package:my_news_app/widgets/my_category_card.dart';
import 'package:my_news_app/widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(249, 152, 28, 201),
      centerTitle: true,
      title: Text('News App',style: TextStyle(color: Colors.white,fontSize: 24),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CategoryList()),
            SliverToBoxAdapter(child: SizedBox(height: 20,),),
            ListViewBuilder(category: 'general')
          ],
        ),
      )
    );
  }
}