import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:marvel_wikia/blocs/blocs.dart';
import 'package:marvel_wikia/blocs/mwk_blocs.dart';
import 'package:marvel_wikia/configs/configs.dart';
import 'package:marvel_wikia/screens/screens.dart';
import 'package:marvel_wikia/utils/utils.dart';

class MWKApp extends StatefulWidget {
  const MWKApp({super.key});

  @override
  State<MWKApp> createState() => _MWKAppState();
}

class _MWKAppState extends State<MWKApp> {
  @override
  void initState() {
    super.initState();
    MWKBlocs.applicationCubit.onSetup();
  }

  @override
  void dispose() {
    MWKBlocs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MWKBlocs.providers,
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, lang) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (context, theme) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Marvel Wikia',
                theme: theme,
                themeMode: ThemeMode.system,
                navigatorKey: NavigationService.navigatorKey,
                onGenerateRoute: MWKRoutes.generateRoute,
                locale: lang,
                localizationsDelegates: const [
                  MWKTranslate.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: MWKLanguage.supportedLanguage,
                home: BlocListener<MessageCubit, MessageSend>(
                  listener: (context, messageSend) {
                    final snackBar = SnackBar(
                      backgroundColor: messageSend.backgroundColor,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 100.0),
                      content: Text(messageSend.message, style: TextStyle(color: messageSend.foregroundColor)),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: BlocBuilder<ApplicationCubit, ApplicationState>(
                    builder: (context, application) {
                      switch (application) {
                        case ApplicationState.loading:
                          return const SplashScreen();
                        case ApplicationState.completed:
                          return const HomePage();
                        case ApplicationState.failure:
                          return const ErrorPage();
                        default:
                          return const SplashScreen();
                      }
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
