import 'package:flutter/material.dart';
import 'package:marvel_wikia/utils/translate.dart';

class CharacterDetails extends StatefulWidget {
  final String thumbnail;
  final String name;
  final String description;
  final String url;

  const CharacterDetails({
    super.key,
    required this.thumbnail,
    required this.name,
    required this.description,
    required this.url,
  });

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.thumbnail,
            fit: BoxFit.cover,
            width: 192,
            height: 210,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.name.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            MWKTranslate.of(context).translate('description'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            MWKTranslate.of(context).translate('comics-available'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.url,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
