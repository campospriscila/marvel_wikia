import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(super.initialState);

  void toggleTheme(bool isDarkMode) {
    if (isDarkMode) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }
}
