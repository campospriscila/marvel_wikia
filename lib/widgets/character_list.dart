import 'package:flutter/material.dart';

import 'package:marvel_wikia/models/character_model.dart';
import 'package:marvel_wikia/utils/translate.dart';
import 'package:marvel_wikia/widgets/character_dialog.dart';

class CharacterList extends StatefulWidget {
  final String thumbnail;
  final String name;
  final String description;
  final String comics;
  final int id;

  const CharacterList({
    super.key,
    required this.thumbnail,
    required this.name,
    required this.description,
    required this.comics,
    required this.id,
  });

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    final character = CharacterModel(
      id: widget.id,
      name: widget.name,
      description: widget.description,
      thumbnail: widget.thumbnail,
      comics: widget.comics,
    );

    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CharacterDialog(character: character),
        );
      },
      tileColor: Theme.of(context).colorScheme.primary,
      hoverColor: Theme.of(context).colorScheme.primaryContainer,
      leading: Image.network(widget.thumbnail),
      title: Text(widget.name),
      subtitle: Text(
          widget.description.isNotEmpty ? widget.description : MWKTranslate.of(context).translate('no-description')),
    );
  }
}
