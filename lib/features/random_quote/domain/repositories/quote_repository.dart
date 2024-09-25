import 'package:dartz/dartz.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/features/random_quote/data/models/quote_model.dart';

abstract class QuoteRepository {
  Future<Either<Failure, QuoteModel>> getRandomQuote();
}
