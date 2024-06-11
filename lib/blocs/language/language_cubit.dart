import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:marvel_wikia/configs/mwk_language.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(MWKLanguage.defaultLanguage);

  ///On Change Language
  void onUpdate(Locale locale) {
    emit(locale);
  }
}
