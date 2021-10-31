import 'package:appnews/models/article.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.description),
      leading: Image.network(article.urlToImage),
    );
  }
}
