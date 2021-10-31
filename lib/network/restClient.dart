import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:appnews/models/everything_response.dart';

class RestClient {
  Future<EveryThingResponse> everything() async {
    final response = await http.get(Uri.parse(
            /*'https://newsapi.org/v2/everything?q=italy*/ 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=b315b0b25db54b2a8a5b1a6c07757f1e') /*, headers: {
      HttpHeaders.authorizationHeader: 'Bearer b315b0b25db54b2a8a5b1a6c07757f1e'
    }*/
        );

    if (response.statusCode == 200) {
      return EveryThingResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("non riesco a vedere il json");
    }
  }
}
