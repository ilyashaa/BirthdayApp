import 'package:birthday_app/entity/image_start.dart';
import 'package:birthday_app/screens/main_screens/entertainments_widget.dart';
import 'package:birthday_app/screens/main_screens/guest_button.dart';
import 'package:birthday_app/screens/main_screens/menu_list_widget.dart';
import 'package:birthday_app/screens/main_screens/maps_yandex.dart';
import 'package:flutter/material.dart';
import 'package:birthday_app/screens/main_screens/image_top.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(5.0.h),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 250.h,
              child: ImageTop(),
            ),
            InvitationWidget(),
            GuestButton(),
            MenuListWidget(),
            EntertainmentsWidget(),
            YandexMapWidget(),
          ],
        ),
      ),
    );
  }
}
