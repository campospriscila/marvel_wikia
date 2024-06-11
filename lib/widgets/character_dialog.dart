import 'package:flutter/material.dart';

import 'package:marvel_wikia/models/character_model.dart';
import 'package:marvel_wikia/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterDialog extends StatelessWidget {
  final CharacterModel character;

  const CharacterDialog({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              character.thumbnail,
              width: 292,
              height: 310,
            ),
            MWKSizing.columnPadding16,
            Text(
              character.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            MWKSizing.columnPadding16,
            Text(
              MWKTranslate.of(context).translate('description').toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            MWKSizing.columnPadding8,
            Text(character.description.isNotEmpty
                ? character.description
                : MWKTranslate.of(context).translate('no-description')),
            MWKSizing.columnPadding16,
            Text(
              MWKTranslate.of(context).translate('comics-available').toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            MWKSizing.columnPadding8,
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(character.comics);

                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppBrowserView);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text(
                character.comics,
                style: TextStyle(color: Theme.of(context).primaryColor, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(MWKTranslate.of(context).translate('close')),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
