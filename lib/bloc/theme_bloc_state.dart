// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_bloc.dart';

@immutable
class ThemeBlocState extends Equatable {
  final ThemeDataKeys? theme;

  const ThemeBlocState({
    this.theme,
  });

  ThemeBlocState copyWith({
    ThemeDataKeys? theme,
  }) {
    return ThemeBlocState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];
}
