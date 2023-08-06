import 'package:birthday_app/domain/entity/guest/guest.dart';
import 'package:birthday_app/presentation/pages/guest/widgets/new_guest_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/adapters.dart';

class GuestHomeWidgetModel extends ChangeNotifier {
  var _guest = <Guest>[];

  List<Guest> get guest => _guest.toList();

  GuestHomeWidgetModel() {
    _setup();
  }

  void showForm(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) => NewGuest(),
    );
  }

  void deleteGuest(int guestIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GuestAdapter());
    }
    final box = await Hive.openBox<Guest>('guest_box');
    await box.deleteAt(guestIndex);
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GuestAdapter());
    }
    final box = await Hive.openBox<Guest>('guest_box');
    _readGuestFromHive(box);
    box.listenable().addListener(() {
      _readGuestFromHive(box);
    });
  }

  void _readGuestFromHive(Box<Guest> box) {
    _guest = box.values.toList();
    notifyListeners();
  }
}

class GuestHomeWidgetModelProvider extends InheritedNotifier {
  final GuestHomeWidgetModel model;
  const GuestHomeWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget this.child,
  }) : super(
          key: key,
          child: child,
          notifier: model,
        );

  final Widget child;

  static GuestHomeWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GuestHomeWidgetModelProvider>();
  }

  static GuestHomeWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GuestHomeWidgetModelProvider>()
        ?.widget;
    return widget is GuestHomeWidgetModelProvider ? widget : null;
  }
}
