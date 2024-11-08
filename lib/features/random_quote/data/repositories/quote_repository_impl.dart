import 'package:dartz/dartz.dart';
import 'package:quote_app/core/error/exceptions.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/core/network/network_info.dart';
import 'package:quote_app/features/random_quote/data/datasources/random_quote_local_data_source.dart';
import 'package:quote_app/features/random_quote/data/datasources/random_quote_remote_data_source.dart';
import 'package:quote_app/features/random_quote/domain/entities/quote.dart';
import 'package:quote_app/features/random_quote/domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource remoteDataSource;
  final RandomQuoteLocalDataSource localDataSource;
  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override

  /// Try to get a random quote from the remote data source first.
  /// If the remote data source fails, try to get the last random quote from the local data source.
  /// If the local data source fails, return a CacheFailure.
  ///
  /// Returns a Either, where the left side is a Failure and the right side is a QuoteModel.
  Future<Either<Failure, Quote>> getRandomQuote() async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteQuote = await remoteDataSource.getRemoteRandomQuote();
      await localDataSource.cacheRandomQuote(remoteQuote);
      return right(remoteQuote);
    } on ServerException {
      return left(ServerFailure());
    }
    //   } else {
    //     try {
    //       final localQuote = await localDataSource.getLastRandomQuote();
    //       return right(localQuote);
    //     } on CacheException {
    //       return left(CacheFailure());
    //     }
    //   }
    // }
  }
}
