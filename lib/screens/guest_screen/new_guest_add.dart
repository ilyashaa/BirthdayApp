import 'package:birthday_app/model/guest_add_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewGuest extends StatefulWidget {
  const NewGuest({super.key});

  @override
  State<NewGuest> createState() => _NewGuestState();
}

class _NewGuestState extends State<NewGuest> {
  final _model = GuestListAddModel();
  @override
  Widget build(BuildContext context) {
    return GuestAddWidgetModelProvider(_model, const _NewGuestWidgetBody());
  }
}

class _NewGuestWidgetBody extends StatelessWidget {
  const _NewGuestWidgetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = GuestAddWidgetModelProvider.read(context)?.model;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Container(
                width: 35.w,
                height: 2.h,
                color: Colors.grey,
              ),
              SizedBox(
                height: 10.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(242, 248, 239, 1),
                    label: Text(
                      'Имя',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          height: 23.12.h / 16.sp),
                    ),
                  ),
                  onChanged: (value) => model?.guestName = value,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(242, 248, 239, 1),
                    label: Text(
                      'Фамилия',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          height: 23.12.h / 16.sp),
                    ),
                  ),
                  onChanged: (value) => model?.guestSurname = value,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(242, 248, 239, 1),
                      label: Text(
                        'Дата рождения',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: 23.12.h / 16.sp),
                      )),
                  onChanged: (value) => model?.guestData = value,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(242, 248, 239, 1),
                      label: Text(
                        'Телефон',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: 23.12.h / 16.sp),
                      )),
                  onChanged: (value) => model?.guestNumber = value,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(242, 248, 239, 1),
                    label: Text(
                      'Профессия',
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          height: 23.12.h / 16.sp),
                    ),
                  ),
                  onChanged: (value) => model?.guestProfession = value,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromRGBO(71, 128, 43, 1),
                  ),
                ),
                onPressed: () => GuestAddWidgetModelProvider.read(context)
                    ?.model
                    .saveChange(context),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 36.5.w, vertical: 5.h),
                  child: Text(
                    'Записаться',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        height: 23.12.h / 16.sp,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
