import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_wikia/blocs/application/application_state.dart';
import 'package:marvel_wikia/configs/application.dart';
import 'package:marvel_wikia/repositories/characters_repository.dart';

class ApplicationCubit extends Cubit<ApplicationState> {
  ApplicationCubit() : super(ApplicationState.loading);

  Future onSetup() async {
    emit(ApplicationState.loading);

    bool result;

    result = await _getPopularCharacters();
    if (result == false) {
      emit(ApplicationState.failure);
    }

    result = await _getAllCharacters();
    if (result == false) {
      emit(ApplicationState.failure);
    }

    if (Application.allCharacters.isNotEmpty && Application.popularCharacters.isNotEmpty) {
      emit(ApplicationState.completed);
    }
  }

  Future<bool> _getPopularCharacters() async {
    try {
      final popularCharacters = await CharactersRepository.getPopularCharacters();

      if (popularCharacters.isNotEmpty) {
        Application.popularCharacters = popularCharacters;

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('_getPopularCharacters error catched: ${e.toString()}');

      return false;
    }
  }

  Future<bool> _getAllCharacters() async {
    try {
      final characters = await CharactersRepository.getAllCharacters();

      if (characters.isNotEmpty) {
        Application.allCharacters = characters.where((character) {
          return !Application.popularCharacterIds.contains(character.id);
        }).toList();

        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('_getAllCharacters error catched: ${e.toString()}');

      return false;
    }
  }
}
