import 'dart:async';

import 'package:appnews/models/article.dart';
import 'package:appnews/models/everything_response.dart';
import 'package:appnews/network/restClient.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.restClient}) : super(FetchingNewsState());

  final RestClient restClient;

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNewsEvent) {
      yield FetchingNewsState();
      EveryThingResponse? response;

      try {
        response = await restClient.everything();
      } catch (error) {
        yield ErrorNewsState(error.toString());
      }

      if (response != null) {
        if (response.articles.isNotEmpty) {
          yield FetchedNewsState(response.articles);
        } else {
          NoNewsState();
        }
      } else {
        ErrorNewsState('errore generico');
      }
    }
  }

  void fetchNews() => add(FetchNewsEvent());
}
