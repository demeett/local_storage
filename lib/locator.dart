import 'package:get_it/get_it.dart';
import 'package:local_storage/local_manager/hive_base_class.dart';

GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerSingleton<IHive>(HiveImpl());
}
