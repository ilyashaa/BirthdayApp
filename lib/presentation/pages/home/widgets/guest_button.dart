import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.h,
            width: 156.w,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(253, 172, 7, 1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/b');
              },
              child: Text(
                'Список гостей',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    height: 23.12.h / 16.sp,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 156.w,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromRGBO(253, 172, 7, 1),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r)),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Вишлист',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Jost',
                    height: 23.12.h / 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
