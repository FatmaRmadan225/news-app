import 'package:flutter/material.dart';
import 'package:my_news_app/modles/article_modle.dart';
import 'package:my_news_app/widgets/tile.dart';

class ListViews extends StatelessWidget {
  const ListViews({super.key, required this.article_models});
  final List<ArticleModle> article_models;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: article_models.length, (
        context,
        i,
      ) {
       return Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Tile(articleModle: article_models[i]),
        );
      }),
    );
  }
}