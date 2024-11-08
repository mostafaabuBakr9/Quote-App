

import 'package:dartz/dartz.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/core/usecases/usecase.dart';
import 'package:quote_app/features/splash_screen/domain/repositories/lang_repository.dart';

class GetSavedLangUseCase implements Usecase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
