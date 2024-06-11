import 'package:marvel_wikia/models/models.dart';

class Application {
  static List<CharacterModel> popularCharacters = [];
  static List<CharacterModel> allCharacters = [];
  static const List<int> popularCharacterIds = [1009327, 1009718, 1009268, 1009417, 1009629];
  static const String publicKey = '535a1caec6d50dd4ca10f62523cc23a1';
  static const String privateKey = '115b724ddfdb83145a930fedd1e741a7b08f8c05';

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
