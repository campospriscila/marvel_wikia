import 'package:flutter/material.dart';

import 'package:marvel_wikia/screens/screens.dart';

/// [MWKRoutes] contém as rotas nomeadas usadas no aplicativo.
class MWKRoutes {
  // Nome das rotas usadas no aplicativo
  static const String home = '/';
  static const String settingsPage = '/settings';
  static const String characterDetails = '/characterDetails';

  /// [generateRoute] é chamado pelo [MaterialApp.onGenerateRoute] para
  /// construir a rota apropriada com base nas configurações fornecidas.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
          fullscreenDialog: true,
        );
      case settingsPage:
        return MaterialPageRoute(
          builder: (context) {
            return const SettingsPage();
          },
        );
      case characterDetails:
        return MaterialPageRoute(
          builder: (context) {
            final Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;

            return CharacterDetails(
              thumbnail: arguments['thumbnail'],
              name: arguments['name'],
              description: arguments['description'],
              url: arguments['url'],
            );
          },
        );
      default:
        return _errorRoute();
    }
  }

  /// Retorna uma rota de erro para rotas desconhecidas
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const ErrorPage(),
    );
  }
}
