import 'package:dartz/dartz.dart';
import 'package:quote_app/core/error/failures.dart';
import 'package:quote_app/features/splash_screen/data/datasources/lang_local_data_source.dart';
import 'package:quote_app/features/splash_screen/domain/repositories/lang_repository.dart';

class LangRepositoryImpl extends LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});
  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode!);
    } on CacheFailure {
      return Left(CacheFailure());
    }
  }
}
