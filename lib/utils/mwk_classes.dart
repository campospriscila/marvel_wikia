import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Serviço de navegação para gerenciar a navegação do aplicativo
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

/// Classe utilitária para carregar arquivos JSON
class MWKAssets {
  /// Carrega um arquivo JSON a partir do caminho fornecido
  static Future<Map<String, dynamic>> loadJson(String path) async {
    try {
      String content = await rootBundle.loadString(path);
      return jsonDecode(content);
    } catch (e) {
      debugPrint('Erro ao carregar JSON do caminho $path: $e');
      return {};
    }
  }

  /// Singleton factory
  static final MWKAssets _instance = MWKAssets._internal();

  factory MWKAssets() {
    return _instance;
  }

  MWKAssets._internal();
}
