import 'package:flutter/material.dart';

class ImageStart {
  final int id;
  final String title;
  final String way;

  ImageStart(this.id, this.title, this.way);
}

List<ImageStart> imageStartList = [
  ImageStart(1, '25 августа 2023', 'assets/imageTop/first.png'),
  ImageStart(2, 'Будет праздник!', 'assets/imageTop/second.jpg'),
  ImageStart(
      3, 'С собой иметь настроение и деньги!', 'assets/imageTop/third.jpeg'),
  ImageStart(4, 'Coming soon..', 'assets/imageTop/fourth.jpg'),
];
