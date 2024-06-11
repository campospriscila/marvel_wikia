import 'package:flutter/material.dart';
import 'package:marvel_wikia/models/character_model.dart';
import 'package:marvel_wikia/utils/utils.dart';
import 'package:marvel_wikia/widgets/character_dialog.dart';

class CharacterCard extends StatefulWidget {
  final String thumbnail;
  final String name;
  final String description;
  final String comics;
  final int id;

  const CharacterCard({
    super.key,
    required this.thumbnail,
    required this.name,
    required this.description,
    required this.comics,
    required this.id,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final character = CharacterModel(
      id: widget.id,
      name: widget.name,
      description: widget.description,
      thumbnail: widget.thumbnail,
      comics: widget.comics,
    );

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => CharacterDialog(character: character),
          );
        },
        child: Card(
          color: _isHovering ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Image.network(
                widget.thumbnail,
                fit: BoxFit.cover,
                width: 192,
                height: 210,
              ),
              MWKSizing.columnPadding16,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name.toUpperCase(),
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
                      MWKSizing.columnPadding8,
                      Text(
                        MWKTranslate.of(context).translate('description').toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      MWKSizing.columnPadding8,
                      Flexible(
                        child: Text(
                          widget.description.isNotEmpty
                              ? widget.description
                              : MWKTranslate.of(context).translate('no-description'),
                          maxLines: 5,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
