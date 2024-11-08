import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/config/locale/app_localizations_setup.dart';
import 'package:quote_app/config/routes/app_routes.dart';
import 'package:quote_app/config/themes/app_them.dart';
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:quote_app/features/splash_screen/presentation/cubit/local_cubit.dart';
import 'package:quote_app/injection_container.dart' as di;

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocalCubit>()..getSavedLangg(),
        ),
      ],
      child: BlocBuilder<LocalCubit, LocalState>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            locale: state.locale,
            theme: AppThemes.blueAppThemeLight(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
