import 'package:birthday_app/models/entertaiment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntertainmentsWidget extends StatefulWidget {
  const EntertainmentsWidget({super.key});

  @override
  State<EntertainmentsWidget> createState() => _EntertainmentsWidgetState();
}

class _EntertainmentsWidgetState extends State<EntertainmentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: entertainmentsList.length,
            itemExtent: 58.w,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(entertainmentsList[index].way),
                  Padding(
                    padding: EdgeInsets.all(7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entertainmentsList[index].title,
                          style: TextStyle(
                              color: Color.fromRGBO(23, 16, 16, 1),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jost'),
                        ),
                        Text(
                          entertainmentsList[index].subTitle,
                          style: TextStyle(
                              color: Color.fromRGBO(78, 67, 67, 1),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Jost'),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chevron_right))
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
