import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/core/usecases/usecase.dart';
import 'package:quote_app/features/random_quote/data/models/quote_model.dart';
import 'package:quote_app/features/random_quote/domain/repositories/quote_repository.dart';

class GetRandomQuote implements Usecase<QuoteModel, LoginParams> {
  final QuoteRepository quoterepository;

  GetRandomQuote({required this.quoterepository});

  @override
  Future<Either<Failure, QuoteModel>> call(LoginParams params) {
        // return quoterepository.getRandomQuote();

    return quoterepository.getRandomQuote();
    }
}

class LoginParams extends Equatable {
  final String userName;
  final String password;
  const LoginParams({
    required this.userName,
    required this.password,
  });
  @override
  List<Object?> get props => [userName, password];
}
