import 'package:get_it/get_it.dart';
import 'package:local_storage/local_manager/hive_manager.dart';

import 'constant/theme_constant.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerSingleton<IHiveManager>(HiveManagerImpl());
  getIt.registerSingleton<Themes>(Themes());
}
