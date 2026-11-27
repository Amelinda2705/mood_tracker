import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_tracker/model/mood.dart';

class MoodService {
  static late Box<Mood> box;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MoodAdapter());
    box = await Hive.openBox<Mood>('moods');
  }
}
