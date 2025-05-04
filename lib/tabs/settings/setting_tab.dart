import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "dark mode",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark, // true
                onChanged:
                    (isDark) => settingsProvider.changeTheme(
                      isDark ? ThemeMode.dark : ThemeMode.light,
                    ),
                activeTrackColor:
                    settingsProvider.isDark
                        ? AppTheme.lightPrimary
                        : AppTheme.black,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "language",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere(
                    (language) =>
                        language.code == settingsProvider.languageCode,
                  ),

                  items:
                      languages
                          .map(
                            (language) => DropdownMenuItem<Language>(
                              child: Text(
                                language.name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              value: language,
                            ),
                          )
                          .toList(),
                  onChanged: (selected_language) {
                    if (selected_language != null) {
                      settingsProvider.changeLanguage(selected_language.code);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor:
                      settingsProvider.isDark
                          ? AppTheme.darkPrimary
                          : AppTheme.white,
                  iconEnabledColor:
                      settingsProvider.isDark ? AppTheme.gold : AppTheme.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
