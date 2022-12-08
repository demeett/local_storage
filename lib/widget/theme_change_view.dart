import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_bloc.dart';
import '../bloc/theme_bloc_state.dart';

class ThemeChangeView extends StatelessWidget {
  const ThemeChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CustomRadioTile(
            text: "Pink Theme",
            themeDataKey: ThemeDataKeys.pinkTheme,
            callBack: (pink) async {
              await context.read<ThemeBloc>().changeTheme(pink);
            },
          ),
          CustomRadioTile(
            text: "Purple Theme",
            themeDataKey: ThemeDataKeys.purpleTheme,
            callBack: (purple) async {
              await context.read<ThemeBloc>().changeTheme(purple);
            },
          ),
          CustomRadioTile(
            text: "Red Theme",
            themeDataKey: ThemeDataKeys.redTheme,
            callBack: (red) async {
              await context.read<ThemeBloc>().changeTheme(red);
            },
          ),
        ],
      ),
    );
  }
}

typedef ThemeCallBack = void Function(ThemeDataKeys key);

class CustomRadioTile extends StatelessWidget {
  const CustomRadioTile({
    super.key,
    required this.text,
    required this.themeDataKey,
    required this.callBack,
  });
  final String text;
  final ThemeDataKeys themeDataKey;
  final ThemeCallBack callBack;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
      builder: (context, state) {
        return ListTile(
          title: Text(text),
          leading: Radio<ThemeDataKeys>(
            value: themeDataKey,
            groupValue: state.theme,
            onChanged: (value) {
              callBack(themeDataKey);
            },
          ),
        );
      },
    );
  }
}
