import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import 'package:marvel_wikia/configs/configs.dart';
import 'package:marvel_wikia/models/character_model.dart';

class CharactersRepository {
  static String publicKey = Application.publicKey;
  static String privateKey = Application.privateKey;

  // IDs of the popular characters
  static List<int> popularCharacterIds = Application.popularCharacterIds;

  static String generateMD5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static Future<List<CharacterModel>> getAllCharacters({int limit = 20, int offset = 0}) async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = generateMD5('$ts$privateKey$publicKey');

    final String url =
        'https://gateway.marvel.com/v1/public/characters?ts=$ts&apikey=$publicKey&hash=$hash&limit=$limit&offset=$offset';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['data']['results'] as List;

      return results.map((character) => CharacterModel.fromJson(character)).toList();
    } else {
      throw Exception('Failed to load characters: ${response.reasonPhrase}');
    }
  }

  static Future<List<CharacterModel>> getPopularCharacters() async {
    final String ts = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = generateMD5('$ts$privateKey$publicKey');

    List<CharacterModel> popularCharacters = [];

    for (int id in popularCharacterIds) {
      final String url = 'https://gateway.marvel.com/v1/public/characters/$id?ts=$ts&apikey=$publicKey&hash=$hash';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['data']['results'] as List;

        if (results.isNotEmpty) {
          popularCharacters.add(CharacterModel.fromJson(results.first));
        }
      } else {
        throw Exception('Failed to load character with ID $id');
      }
    }

    return popularCharacters;
  }
}
