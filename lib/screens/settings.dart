import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_wikia/blocs/blocs.dart';
import 'package:marvel_wikia/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'pt';

  @override
  void initState() {
    super.initState();

    final themeCubit = context.read<ThemeCubit>();
    final languageCubit = context.read<LanguageCubit>();

    _isDarkMode = themeCubit.state.brightness == Brightness.dark;
    _selectedLanguage = languageCubit.state.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MWKTranslate.of(context).translate('settings'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              label: MWKTranslate.of(context).translate('settings-language'),
              child: Text(
                MWKTranslate.of(context).translate('settings-language'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            MWKSizing.columnPadding8,
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                  Locale newLocale = Locale(_selectedLanguage);
                  context.read<LanguageCubit>().onUpdate(newLocale);
                });
              },
              items: <String>['pt', 'en', 'es', 'fr'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value == 'pt'
                      ? 'Português'
                      : value == 'en'
                          ? 'English'
                          : value == 'es'
                              ? 'Español'
                              : 'Français'),
                );
              }).toList(),
            ),
            MWKSizing.columnPadding16,
            Semantics(
              label: MWKTranslate.of(context).translate('settings-theme'),
              child: Text(
                MWKTranslate.of(context).translate('settings-theme'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            MWKSizing.columnPadding8,
            SwitchListTile(
              title: Semantics(
                label: MWKTranslate.of(context).translate('settings-theme-mode'),
                child: Text(
                  MWKTranslate.of(context).translate('settings-theme-mode'),
                ),
              ),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                  context.read<ThemeCubit>().toggleTheme(value);
                });
              },
            ),
            MWKSizing.columnPadding16,
            Semantics(
              label: MWKTranslate.of(context).translate('settings-cache'),
              child: Text(
                MWKTranslate.of(context).translate('settings-cache'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            MWKSizing.columnPadding8,
            SwitchListTile(
              title: Semantics(
                label: MWKTranslate.of(context).translate('settings-cache-save'),
                child: Text(
                  MWKTranslate.of(context).translate('settings-cache-save'),
                ),
              ),
              value: false,
              onChanged: null,
            ),
          ],
        ),
      ),
    );
  }
}
