import 'package:hive/hive.dart';

part 'mood.g.dart';

@HiveType(typeId: 0)
class Mood extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  String mood;

  @HiveField(2)
  String notes;

  Mood({required this.date, required this.mood, required this.notes});
}
