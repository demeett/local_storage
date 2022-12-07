import 'package:hive_flutter/hive_flutter.dart';

abstract class IHive {
  Future<void> init();
  dynamic getMethod(dynamic key);
  dynamic putMethod(dynamic key, dynamic value);
  Future<dynamic> addMethod(dynamic value);
}

class HiveImpl implements IHive {
  Box? _box;
  @override
  Future<void> init() async {
    Hive.init('database');
    _box = await Hive.openBox<dynamic>("globalKey");
  }

  @override
  Future<dynamic> getMethod(dynamic key) async {
    await init();
   return  _box!.get(key);
  }

  @override
  dynamic putMethod(dynamic key, dynamic value) async => await _box!.put(key, value);
  @override
  Future<int> addMethod(dynamic value) async {
    await init();
    return await _box?.add(value) ?? 0;
  }
}
