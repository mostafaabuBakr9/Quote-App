import 'package:dartz/dartz.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/core/usecases/usecase.dart';
import 'package:quote_app/features/splash_screen/domain/repositories/lang_repository.dart';

class ChangeLangUseCase implements Usecase<bool, String> {
  final LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String langCode) async =>
      await langRepository.changeLang(langCode: langCode);
}
