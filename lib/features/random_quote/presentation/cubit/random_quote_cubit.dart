import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/core/usecases/usecase.dart';
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:quote_app/features/random_quote/domain/entities/quote.dart';
import 'package:quote_app/features/random_quote/domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteIsLoading());
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());
    emit(response.fold(
      (failure) => RandomQuoteError(message: _mapFailuerTomsg(failure)),
      (quote) => RandomQuoteLoaded(quote),
    ));
  }

  String _mapFailuerTomsg(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return AppStrings.serverFailure;
      case const (CacheFailure):
        return AppStrings.cacheFailure;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
