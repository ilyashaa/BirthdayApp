import 'package:hive/hive.dart';

part 'guest.g.dart';

@HiveType(typeId: 1)
class Guest {
  Guest(
      {required this.name,
      required this.surname,
      required this.data,
      required this.number,
      required this.profession});

  @HiveField(0)
  String name;

  @HiveField(1)
  String surname;

  @HiveField(2)
  String data;

  @HiveField(3)
  String number;

  @HiveField(4)
  String profession;
}
