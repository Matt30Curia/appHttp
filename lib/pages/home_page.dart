import 'package:appnews/blocs/news/news_bloc.dart';
import 'package:appnews/models/article.dart';
import 'package:appnews/widgets/article_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:appnews/blocs/news/news_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('news')),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is ErrorNewsState)
            return _errorNews(state.toString());
          else if (state is FetchingNewsState)
            return _loadingNews();
          else if (state is NoNewsState)
            return _errorNews("non ci sono notizie");
          else if (state is FetchedNewsState) return _listNews(state.articles);

          return Container();
        },
      ),
    );
  }

  Widget _errorNews(String error) => Center(
        child: Text(error),
      );

  Widget _loadingNews() => Center(child: CircularProgressIndicator());

  Widget _listNews(List<Article> articles) => ListView.builder(
        itemBuilder: (context, index) => ArticleWidget(articles[index]),
        itemCount: articles.length,
      );
}
