import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_storage/local_manager/hive_base_class.dart';
import 'package:local_storage/locator.dart';

void main() {
  setUp(() async {
    //Hive.init('database');
    setUpLocator();
    await getIt<IHive>().init();
  });
  test('Name Box Create and Box', () async {
    final box = await Hive.openBox<dynamic>('nesne');
    //openlazybox=>projede kullanılana kadar nesneyi harekete geçirmiyo, oluşturmuyo.
    //box.put(içerisine_istediğimiz_tür_veri_adı, verinin_değeri)=>Add gibi sürekli üstüne eklemez var olan değeri günceller.
    //box.get('key_ismi);
    await box.add('demet');
    box.get("");
    expect(box.values.first, 'demet');
  });

  test('Name ', () async {
    //final box = await Hive.openBox<dynamic>('nesne');
    int data = await HiveImpl().addMethod('demet');
    String? key = await HiveImpl().getMethod('globalkey');
    expect(key, 'demet');
    //openlazybox=>projede kullanılana kadar nesneyi harekete geçirmiyo, oluşturmuyo.
    //box.put(içerisine_istediğimiz_tür_veri_adı, verinin_değeri)=>Add gibi sürekli üstüne eklemez var olan değeri günceller.
    //box.get('key_ismi);
    // await box.add('demet');
    // box.get("");
    //expect(box.values.first, 'demet');
  });
}
