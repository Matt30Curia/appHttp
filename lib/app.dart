import 'package:appnews/blocs/news/news_bloc.dart';
import 'package:appnews/network/restClient.dart';
import 'package:appnews/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  NewsBloc(restClient: context.read<RestClient>())..fetchNews())
        ],
        child: MaterialApp(
            title: 'News http bloc app',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: HomePage()),
      ),
      providers: [RepositoryProvider(create: (_) => RestClient())],
    );
  }
}
