import 'package:hive_flutter/adapters.dart';

part 'oquvchi.g.dart';

@HiveType(typeId: 0)
class Oquvchi {
  @HiveField(0)
  String ism;
  @HiveField(1)
  String familiya;
  @HiveField(2)
  String yosh;

  Oquvchi({
    required this.ism,
    required this.familiya,
    required this.yosh});
}
