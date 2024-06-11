import 'package:flutter/material.dart';

/// A classe [MWKLanguage] gerencia os idiomas suportados pelo aplicativo.
class MWKLanguage {
  static const Locale defaultLanguage = Locale("pt");

  static final List<Locale> supportedLanguage = [
    const Locale("en"),
    const Locale("pt"),
    const Locale("es"),
    const Locale("fr"),
  ];

  /// Retorna o nome global do idioma com base no código de idioma fornecido
  static String getGlobalLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'pt':
        return 'Brazilian - Portuguese';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';

      default:
        return 'Unknown';
    }
  }

  /// Singleton factory
  static final MWKLanguage _instance = MWKLanguage._internal();

  factory MWKLanguage() {
    return _instance;
  }

  MWKLanguage._internal();
}
