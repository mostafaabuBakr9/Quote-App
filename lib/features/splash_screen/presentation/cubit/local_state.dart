// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'local_cubit.dart';

abstract class LocalState extends Equatable {
  final Locale locale;
  const LocalState(this.locale);

  @override
  List<Object> get props => [];
}

class LocalInitial extends LocalState {
  const LocalInitial(
    super.selectedLocale,
  );
}
