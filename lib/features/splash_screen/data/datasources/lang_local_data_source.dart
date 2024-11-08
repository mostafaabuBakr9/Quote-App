// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LangLocalDataSource {
  Future<String?> getSavedLang();
  Future<bool> changeLang({required String langCode});
}

class LangLocalDataSourceImpl implements LangLocalDataSource {
  final SharedPreferences sharedPreferences;
  LangLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<String?> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.local)
          ? sharedPreferences.getString(AppStrings.local)
          : AppStrings.englishCode;

  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.local, langCode);
}
