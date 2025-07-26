import 'package:flutter/material.dart';
import 'package:my_news_app/modles/article_modle.dart';
import 'package:url_launcher/url_launcher.dart';

class Tile extends StatelessWidget {
  const Tile({super.key,required this.articleModle});
  final ArticleModle articleModle;

  Future<void> _launchURL(BuildContext context) async {
    final String url = articleModle.url ?? ''; 
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرابط غير متاح')),
      );
      return;
    }

    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في فتح الرابط')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => _launchURL(context),
      child: Column(
        children: [
          ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
      (articleModle.image != null && articleModle.image!.isNotEmpty)
          ? articleModle.image!
          : 'https://cdn4.iconfinder.com/data/icons/sign-line/48/no_camera_photo-1024.png',
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          'https://cdn4.iconfinder.com/data/icons/sign-line/48/no_camera_photo-1024.png', 
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
        ),
      ),
      const SizedBox(height: 12),
          Text(
           articleModle.title,
            maxLines: 2,style: TextStyle(fontSize: 12, color: Colors.black,overflow: TextOverflow.ellipsis,),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModle.subTitle??'',
          maxLines: 2,  style: TextStyle(fontSize: 10, color: Colors.grey,overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
