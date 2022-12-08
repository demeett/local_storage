import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant/theme_constant.dart';
import '../local_manager/hive_manager.dart';
import 'theme_bloc_state.dart';

class ThemeBloc extends Cubit<ThemeBlocState> {
  ThemeBloc(this.hiveManager) : super(const ThemeBlocState());
  final IHiveManager hiveManager;

  void init() {
    final String getStringTheme = hiveManager.get(LocalKeys.theme.name) ?? ThemeDataKeys.defaultValue.name;
    emit(state.copyWith(theme: getStringTheme.convertToKey()));
  }

  Future<void> changeTheme(ThemeDataKeys themeKey) async {
    await put(themeKey); //String olarak convert edip at
    emit(state.copyWith(theme: themeKey));
  }

  Future<void> put(ThemeDataKeys themeKey) async {
    await hiveManager.put(LocalKeys.theme.name, themeKey.name);
  }
}

enum LocalKeys { theme }

enum ThemeDataKeys {
  pinkTheme,
  purpleTheme,
  redTheme;

  static ThemeDataKeys get defaultValue => ThemeDataKeys.pinkTheme;

  ThemeData getTheme(Themes themes) {
    switch (this) {
      case ThemeDataKeys.pinkTheme:
        return themes.pinkTheme;

      case ThemeDataKeys.purpleTheme:
        return themes.purpleTheme;

      case ThemeDataKeys.redTheme:
        return themes.redTheme;
    }
  }
}

extension ThemeDataKeysExtension on String {
  ThemeDataKeys convertToKey() =>
      ThemeDataKeys.values.firstWhereOrNull((element) => element.name == this) ?? ThemeDataKeys.defaultValue;
}
