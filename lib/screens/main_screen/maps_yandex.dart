import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:url_launcher/url_launcher.dart';

class YandexMapWidget extends StatelessWidget {
  const YandexMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Text(
            'Место',
            style: TextStyle(
                fontFamily: 'Yeseva',
                fontWeight: FontWeight.w400,
                fontSize: 24,
                height: 24.h / 14.sp,
                color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: SizedBox(
              height: 230.h,
              child: YandexMap(
                mapObjects: [
                  PlacemarkMapObject(
                      mapId: MapObjectId('1'),
                      point: Point(latitude: 47.242516, longitude: 38.690101),
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          image: BitmapDescriptor.fromAssetImage(
                              'assets/imageMap/baza.png'),
                        ),
                      ))
                ],
                onMapCreated: (YandexMapController controller) {
                  controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                      const CameraPosition(
                        target:
                            Point(latitude: 47.242516, longitude: 38.690101),
                        zoom: 9,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Text(
            'Центральная ул., 84, хутор Седых',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 14.h / 14.sp,
                color: const Color.fromRGBO(78, 67, 67, 1)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h, bottom: 20.h),
            child: GestureDetector(
              child: RichText(
                text: TextSpan(
                  text: 'Перейти на сайт места',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                        Uri.parse('https://github.com/ilyashaa'),
                      );
                    },
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    height: 20.23.h / 14.sp,
                    color: const Color.fromRGBO(23, 16, 16, 1),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
