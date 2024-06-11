import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:marvel_wikia/blocs/characters/characters_state.dart';
import 'package:marvel_wikia/configs/application.dart';
import 'package:marvel_wikia/repositories/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersState.initial);

  Future<void> loadMoreCharacters(int offset) async {
    emit(CharactersState.loadingMore);
    debugPrint('loadMoreCharacters');

    try {
      final characters = await CharactersRepository.getAllCharacters(offset: offset);

      if (characters.isNotEmpty) {
        final filteredCharacters = characters.where((character) {
          return !Application.popularCharacterIds.contains(character.id);
        }).toList();

        Application.allCharacters = List.from(Application.allCharacters)..addAll(filteredCharacters);
        emit(CharactersState.success);
      }
    } catch (e) {
      emit(CharactersState.failure);
    }
  }
}
