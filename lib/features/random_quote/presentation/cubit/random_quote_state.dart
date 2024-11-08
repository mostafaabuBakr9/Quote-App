part of 'random_quote_cubit.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteLoaded extends RandomQuoteState {
  final Quote randomQuote;

  const RandomQuoteLoaded(this.randomQuote);
}

class RandomQuoteError extends RandomQuoteState {
  final String message;

  const RandomQuoteError({required this.message});
}
