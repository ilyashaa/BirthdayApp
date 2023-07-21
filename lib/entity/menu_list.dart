import 'package:flutter/material.dart';

class MenuList {
  final int id;
  final String foodName;
  final String way;

  MenuList(this.id, this.foodName, this.way);
}

List<MenuList> menuList = [
  MenuList(1, 'Канапе', 'assets/imageMenu/1.jpg'),
  MenuList(2, 'Сырная тарелка', 'assets/imageMenu/2.png'),
  MenuList(3, 'Шашлык на мангале', 'assets/imageMenu/3.jpg'),
  MenuList(4, 'Морепродукты', 'assets/imageMenu/4.webp'),
  MenuList(5, 'Свежие фрукты', 'assets/imageMenu/5.jpg'),
  MenuList(6, 'Авторские лемонады', 'assets/imageMenu/6.jpg'),
];
