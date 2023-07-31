import 'package:birthday_app/entity/image_start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageTop extends StatefulWidget {
  const ImageTop({
    super.key,
  });

  @override
  State<ImageTop> createState() => _ImageTopState();
}

class _ImageTopState extends State<ImageTop> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: imageStartList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imageStartList[index].way)),
                    ),
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        height: 24.h / 14.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Jost',
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 15.w,
                            left: 15.h,
                            child: Container(
                              width: 175.w,
                              child: Text(
                                imageStartList[index].title,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 240.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    imageStartList.length,
                    (index) => Indicator(
                        isActive: _selectedIndex == index ? true : false))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 7.0.h),
      width: isActive ? 30.0.w : 5.0.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0.r),
      ),
    );
  }
}

class InvitationWidget extends StatelessWidget {
  const InvitationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Text(
        'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'Jost',
          color: Colors.black,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
