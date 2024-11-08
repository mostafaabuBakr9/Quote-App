import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:quote_app/core/usecases/usecase.dart';
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:quote_app/features/splash_screen/domain/usecases/change_locale.dart';
import 'package:quote_app/features/splash_screen/domain/usecases/get_saved_lang.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocalCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const LocalInitial(Locale(AppStrings.englishCode)));

  String currentLangCode = AppStrings.englishCode;

  Future<void> getSavedLangg() async {
    final response = await getSavedLangUseCase.call(NoParams());

    response.fold(
      (failure) {
        return debugPrint(AppStrings.cacheFailure);
      },
      (value) {
        currentLangCode = value;
        return emit(LocalInitial(Locale(currentLangCode)));
      },
    );
  }

  Future<void> changeLang(String langCode) async {
    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (value) {
      currentLangCode = langCode;
      emit(LocalInitial(Locale(currentLangCode)));
    });
  }

  void toEnglish() => changeLang(AppStrings.englishCode);

  void toArabic() => changeLang(AppStrings.arabicCode);
}
