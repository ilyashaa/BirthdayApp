import 'package:birthday_app/data/models/guest/guest_add_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

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

class _NewGuestWidgetBody extends StatefulWidget {
  const _NewGuestWidgetBody({
    super.key,
  });

  @override
  State<_NewGuestWidgetBody> createState() => _NewGuestWidgetBodyState();
}

class _NewGuestWidgetBodyState extends State<_NewGuestWidgetBody> {
  DateTime? selectedDate;

  int guestYear = 0;

  final formatter = DateFormat.yMd();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      selectedDate = pickedDate;
      guestYear = DateTime.now().year - selectedDate!.year;

      GuestAddWidgetModelProvider.read(context)?.model.guestData =
          guestYear.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = GuestAddWidgetModelProvider.read(context)?.model;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
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
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.name,
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
                child: Container(
                  color: Color.fromRGBO(242, 248, 239, 1),
                  width: 370,
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          selectedDate == null
                              ? 'Дата'
                              : formatter.format(selectedDate!),
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            height: 23.12.h / 16.sp,
                            color: selectedDate == null
                                ? Color.fromRGBO(78, 67, 67, 1)
                                : Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _presentDatePicker();
                          },
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.name,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
