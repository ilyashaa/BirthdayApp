import 'package:birthday_app/entity/entertaiment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntertainmentsWidget extends StatefulWidget {
  const EntertainmentsWidget({super.key});

  @override
  State<EntertainmentsWidget> createState() => _EntertainmentsWidgetState();
}

class _EntertainmentsWidgetState extends State<EntertainmentsWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: isExpanded ? entertainmentsList.length : 2,
            itemExtent: 47.w,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(entertainmentsList[index].way),
                  Padding(
                    padding: EdgeInsets.only(left: 7.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entertainmentsList[index].title,
                          style: TextStyle(
                            color: Color.fromRGBO(23, 16, 16, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jost',
                            height: 20.23.h / 14.sp,
                          ),
                        ),
                        Text(
                          entertainmentsList[index].subTitle,
                          style: TextStyle(
                            color: Color.fromRGBO(78, 67, 67, 1),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Jost',
                            height: 20.23.h / 14.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right))
                ],
              );
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromRGBO(23, 16, 16, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Jost',
                  height: 20.23.h / 14.sp,
                ),
                children: [
                  TextSpan(text: isExpanded ? 'Свернуть ▲' : 'Развернуть ▼'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
