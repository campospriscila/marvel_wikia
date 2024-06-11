// lib/character_model.dart
class CharacterModel {
  final int id;
  final String name;
  final String description;
  final String thumbnail;
  final String comics;

  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail: "${json['thumbnail']['path']}.${json['thumbnail']['extension']}",
      comics: json['urls'].firstWhere((url) => url['type'] == 'comiclink')['url'].toString(),
    );
  }
}
