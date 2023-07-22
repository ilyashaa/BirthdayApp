import 'package:birthday_app/entity/menu_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({super.key});

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: Text(
              'Меню',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  height: 24.h / 14.sp,
                  fontFamily: 'Yeseva'),
            ),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 140.w / 154.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 0.h),
              itemCount: isExpanded ? menuList.length : 2,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: index % 2 == 0
                              ? BorderRadius.only(
                                  topRight: Radius.circular(25.r),
                                  bottomLeft: Radius.circular(25.r))
                              : BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  bottomRight: Radius.circular(25.r)),
                          child: Image(
                            image: AssetImage(menuList[index].way),
                            height: 140.r,
                            width: 140.r,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        menuList[index].foodName.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Jost',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          height: 14.h / 14.sp,
                          color: const Color.fromRGBO(78, 67, 67, 1),
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                );
              }),
          Container(
            child: InkWell(
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
                    height: 20.13.h / 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Jost',
                  ),
                  children: [
                    TextSpan(text: isExpanded ? 'Свернуть ▲' : 'Развернуть ▼'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
