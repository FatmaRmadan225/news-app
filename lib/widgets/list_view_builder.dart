import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/modles/article_modle.dart';
import 'package:my_news_app/services/news_services.dart';
import 'package:my_news_app/widgets/list_view.dart';

class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  var future;
  void initState() {
    // TODO: implement initState
    super.initState();

    future = NewsServices(Dio()).getTopHeadlines(category: widget.category);
  }
@override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModle>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListViews(
              article_models: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
              child: Text('oops  was an error, try later'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<ArticleModle>>(
  //     future: future,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return ListViews(article_models: snapshot.data!);
  //       } else if (snapshot.hasError) {
  //         return const SliverToBoxAdapter(child: Text('error'));
  //       } else {
  //         SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
  //       }
  //     },
  //   );
  // }
}
