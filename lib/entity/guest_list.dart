import 'package:hive_flutter/hive_flutter.dart';

class GuestList {
  GuestList() {
    Hive.initFlutter();
  }
  void doSome() async {
    var box = await Hive.openBox('box');
    box.put('name', 'Ivan');
    final name = box.get('name') as String;
  }
}
