import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quote_app/config/locale/app_localizations.dart';
import 'package:quote_app/core/utils/app_colors.dart';
import 'package:quote_app/core/utils/app_strings.dart';
import 'package:quote_app/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quote_app/features/random_quote/presentation/widgets/quote_content.dart';
import 'package:quote_app/features/random_quote/presentation/widgets/quote_reload.dart';
import 'package:quote_app/core/widgets/error_widget.dart' as error_widget;
import 'package:quote_app/features/splash_screen/presentation/cubit/local_cubit.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  gitRandomQuote() async {
    await BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
  }

  @override
  void initState() {
    gitRandomQuote();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          onPressed: () {
            if (AppLocalizations.of(context)!.locale.languageCode == 'en') {
              BlocProvider.of<LocalCubit>(context).toArabic();
            } else {
              if (AppLocalizations.of(context)!.locale.languageCode == 'ar') {
                BlocProvider.of<LocalCubit>(context).toEnglish();
              }
            }
          },
          icon: Icon(
            Icons.translate_outlined,
            color: AppColors.hint,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      ),
      body: BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
          if (state is RandomQuoteIsLoading) {
            return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                );
              },
            );
          } else if (state is RandomQuoteError) {
            return error_widget.ErrorWidget(
              onPressed: () async {
                await gitRandomQuote();
              },
            );
          } else if (state is RandomQuoteLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                QuoteContent(
                  quote: state.randomQuote,
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      await gitRandomQuote();
                    },
                    child: const QuoteReload())
              ],
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
