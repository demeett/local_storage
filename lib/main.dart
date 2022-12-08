import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme_bloc.dart';
import 'bloc/theme_bloc_state.dart';
import 'constant/theme_constant.dart';
import 'local_manager/hive_manager.dart';
import 'locator.dart';
import 'widget/theme_change_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  await getIt<IHiveManager>().init();
  runApp(
    BlocProvider<ThemeBloc>(
      // !!!!!lazy: false, // Default: true
      create: (context) => ThemeBloc(getIt<IHiveManager>())..init(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeBlocState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.theme?.getTheme(getIt<Themes>()) ?? ThemeData.dark(),
          home: const ThemeChangeView(),
        );
      },
    );
  }
}


// Önemli Kavramlar
//    * 1. BlocProvider
//    * 2. BlocBuilder
//    * 3. BlocSelector
//    * 4. BlocListener
//    * 5. BlocConsumer
//    * 6. context.read<T>
//    * 7. context.watch<T>

