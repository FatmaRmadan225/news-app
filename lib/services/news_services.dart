import 'package:dio/dio.dart';
import 'package:my_news_app/modles/article_modle.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);
  Future<List<ArticleModle>> getTopHeadlines({required String category}) async {
    try {
      var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=5ef5e2e04b3e49708a9feaa5f59b2cd7&category=$category',
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModle> articlesList = [];
      for (var article in articles) {
        ArticleModle articleModle = ArticleModle(
          image: article['urlToImage'],
          subTitle: article['description'],
          title: article['title'],
          url: article["url"]

        );
        articlesList.add(articleModle);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
