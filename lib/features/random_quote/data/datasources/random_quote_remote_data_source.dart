import 'package:quote_app/core/Api/Api_consumer.dart';
import 'package:quote_app/core/Api/end_point.dart';
import 'package:quote_app/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRemoteRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RandomQuoteRemoteDataSource {
  ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<QuoteModel> getRemoteRandomQuote() async {
    final response = await apiConsumer.get(url: EndPoint.randomQuote);
    return QuoteModel.fromJson(response);
  }
}
