import 'package:flutter/material.dart';

import 'package:marvel_wikia/configs/mwk_language.dart';
import 'package:marvel_wikia/utils/mwk_classes.dart';

/// A classe [MWKTranslate] gerencia a tradução de textos para diferentes locais.
class MWKTranslate {
  final Locale locale;
  static const LocalizationsDelegate<MWKTranslate> delegate = MWKLocaleDelegate();
  late Map<String, String> _localizedStrings;

  MWKTranslate(this.locale);

  /// Recupera uma instância de [MWKTranslate] a partir do [BuildContext]
  static MWKTranslate of(BuildContext context) {
    return Localizations.of<MWKTranslate>(context, MWKTranslate)!;
  }

  /// Carrega os arquivos JSON de tradução baseados no código de idioma do locale
  Future<bool> load() async {
    try {
      final jsonMap = await MWKAssets.loadJson(
        "locale/${locale.languageCode}.json",
      );

      if (jsonMap.isEmpty) {
        throw Exception('Falha ao carregar JSON de traduções');
      }

      // Converte o mapa carregado em um mapa de strings
      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });

      return true;
    } catch (e) {
      debugPrint('Erro ao carregar as traduções para ${locale.languageCode}: $e');

      // Tenta carregar o idioma padrão como fallback
      try {
        final defaultJsonMap =
            await MWKAssets.loadJson('assets/locale/${MWKLanguage.defaultLanguage.languageCode}.json');

        if (defaultJsonMap.isEmpty) {
          throw Exception('Falha ao carregar JSON de traduções padrão.');
        }

        _localizedStrings = defaultJsonMap.map((key, value) {
          return MapEntry(key, value.toString());
        });

        return true;
      } catch (defaultError) {
        debugPrint('Erro ao carregar as traduções padrão: $defaultError');
        _localizedStrings = {};
        return false;
      }
    }
  }

  /// Traduz a chave fornecida para o idioma atual
  String translate(String? key) {
    if (key != null) key = key.toLowerCase();
    return _localizedStrings[key] ?? key ?? '';
  }

  /// Método estático para obter o texto traduzido usando a chave e o contexto atual
  static String getText(String? key) {
    return MWKTranslate.of(NavigationService.navigatorKey.currentContext!).translate(key);
  }
}

/// Delegate para gerenciar a carga das localizações
class MWKLocaleDelegate extends LocalizationsDelegate<MWKTranslate> {
  const MWKLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return MWKLanguage.supportedLanguage.contains(locale);
  }

  @override
  Future<MWKTranslate> load(Locale locale) async {
    MWKTranslate localizations = MWKTranslate(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(MWKLocaleDelegate old) => false;
}
