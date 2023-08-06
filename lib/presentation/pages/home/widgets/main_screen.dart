import 'package:birthday_app/presentation/pages/home/widgets/entertainments_widget.dart';
import 'package:birthday_app/presentation/pages/home/widgets/guest_button.dart';
import 'package:birthday_app/presentation/pages/home/widgets/image_top.dart';
import 'package:birthday_app/presentation/pages/home/widgets/maps_yandex.dart';
import 'package:birthday_app/presentation/pages/home/widgets/menu_list_widget.dart';
import 'package:flutter/material.dart';

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
