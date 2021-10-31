import 'dart:core';

import 'package:appnews/models/article.dart';

class EveryThingResponse {
  final String ok;
  final int totalResult;
  final List<Article> articles;

  EveryThingResponse(
      {required this.ok, required this.totalResult, required this.articles});

  factory EveryThingResponse.fromJson(Map<String, dynamic> json) {
    return EveryThingResponse(
        ok: json['ok'],
        totalResult: json['totalResult'],
        articles: (json['articles'] as List)
            .map((articles) => Article.fromJson(articles))
            .toList(growable: false));
  }
}
