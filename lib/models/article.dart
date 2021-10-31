class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  Article(
      {this.title = '',
      this.description = '',
      this.url = '',
      this.urlToImage = ''});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

//  fromJson(Article articles) {}
}


//(JSon['articles'] as List).map((articles) => Article.fromJson(articles)).toList(growable: false))

