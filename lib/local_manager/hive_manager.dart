import 'package:hive_flutter/hive_flutter.dart';

abstract class IHiveManager {
  Future<void> init();
  dynamic get(dynamic key);
  dynamic put(dynamic key, dynamic value);
  Future<dynamic> add(dynamic value);
  Future<String?> getFirst();
}

class HiveManagerImpl implements IHiveManager {
  Box? _box;
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('peopleBox');
  }

  @override
  dynamic get(dynamic key) {
    //_box = Hive.box('peopleBox');
    return _box!.get(key);
  }

  @override
  dynamic put(dynamic key, dynamic value) async => await _box!.put(key, value);

  @override
  Future<int> add(dynamic value) async {
    return await _box?.add(value) ?? 0;
  }

  @override
  Future<String?> getFirst() async {
    return _box?.values.first;
  }

  Future<List?> getAll() async {
    return _box?.values.toList();
  }
}
