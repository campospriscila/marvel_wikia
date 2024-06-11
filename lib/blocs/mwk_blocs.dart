import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_wikia/blocs/blocs.dart';
import 'package:marvel_wikia/configs/mwk_theme.dart';

class MWKBlocs {
  static final applicationCubit = ApplicationCubit();
  static final charactersCubit = CharactersCubit();
  static final languageCubit = LanguageCubit();
  static final messageCubit = MessageCubit();
  static final themeCubit = ThemeCubit(MWKTheme.lightTheme);

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationCubit>(
      create: (context) => applicationCubit,
    ),
    BlocProvider<CharactersCubit>(
      create: (context) => charactersCubit,
    ),
    BlocProvider<LanguageCubit>(
      create: (context) => languageCubit,
    ),
    BlocProvider<MessageCubit>(
      create: (context) => messageCubit,
    ),
    BlocProvider<ThemeCubit>(
      create: (context) => themeCubit,
    ),
  ];

  static void dispose() {
    applicationCubit.close();
    charactersCubit.close();
    languageCubit.close();
    messageCubit.close();
    themeCubit.close();
  }

  ///Singleton factory
  static final MWKBlocs _instance = MWKBlocs._internal();

  factory MWKBlocs() {
    return _instance;
  }

  MWKBlocs._internal();
}
