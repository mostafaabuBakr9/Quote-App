import 'dart:convert';
import 'package:quote_app/core/Api/end_point.dart';
import 'package:quote_app/core/error/exceptions.dart';
import 'package:quote_app/features/random_quote/data/models/quote_model.dart';
import 'package:http/http.dart' as http;

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRemoteRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  http.Client client;

  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRemoteRandomQuote() async {
    final randomQuote = Uri.parse(EndPoint.randomQuote);
    final response = await client.get(randomQuote, headers: {
      'Content-Type': 'accept: application/json',
    });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body));
    } else {
      throw ServerExceptions();
    }
  }
}
