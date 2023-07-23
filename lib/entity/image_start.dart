import 'package:flutter/material.dart';

class ImageStart {
  final String title;
  final String way;

  ImageStart(this.title, this.way);
}

List<ImageStart> imageStartList = [
  ImageStart('25 августа 2023', 'assets/imageTop/first.png'),
  ImageStart('Будет праздник!', 'assets/imageTop/second.jpg'),
  ImageStart(
      'С собой иметь настроение и деньги!', 'assets/imageTop/third.jpeg'),
  ImageStart('Coming soon..', 'assets/imageTop/fourth.jpg'),
];
