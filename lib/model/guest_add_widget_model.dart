import 'package:birthday_app/entity/guest.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GuestListAddModel {
  var guestName = '';
  var guestSurname = '';
  var guestData = '';
  var guestNumber = '';
  var guestProfession = '';
  void saveChange(BuildContext context) async {
    if (guestName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GuestAdapter());
    }

    final box = await Hive.openBox<Guest>('guest_box');
    final guest = Guest(
        name: guestName,
        surname: guestSurname,
        data: guestData,
        number: guestNumber,
        profession: guestProfession);

    box.add(guest);

    Navigator.of(context).pop();
  }
}

class GuestAddWidgetModelProvider extends InheritedWidget {
  final GuestListAddModel model;
  const GuestAddWidgetModelProvider(
    this.model,
    this.child, {
    super.key,
  }) : super(child: child);

  final Widget child;

  static GuestAddWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GuestAddWidgetModelProvider>();
  }

  static GuestAddWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GuestAddWidgetModelProvider>()
        ?.widget;
    return widget is GuestAddWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GuestAddWidgetModelProvider oldWidget) {
    return true;
  }
}
