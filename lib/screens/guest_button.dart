import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuessButton extends StatelessWidget {
  const GuessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
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
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Список гостей',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
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
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Вишлист',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Jost',
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
