import 'package:material_ui/material_ui.dart';

class Global {
  // colors
  Color surface = Colors.white;
  Color primary = const Color(0xff5038BC);
  Color primarySubtle = const Color(0xffE4DEF7);
  Color textPrimary = const Color(0xff111827);
  Color textSecondary = const Color(0xff6B7280);
  Color textOnPrimary = Colors.white;
  Color borderDefault = const Color(0xffE5E7EB);
  Color moodExcited = const Color(0xffFF7EB6);
  Color moodHappy = const Color(0xffFFC247);
  Color moodCalm = const Color(0xff4ECDC4);
  Color moodSad = const Color(0xff5B9BF0);
  Color moodAnxious = const Color(0xffB49AF2);
  Color moodAngry = const Color(0xffFF6B5B);

  // fonts weight
  FontWeight extraBold = FontWeight.w800;
  FontWeight bold = FontWeight.w700;
  FontWeight semiBold = FontWeight.w600;
  FontWeight medium = FontWeight.w500;
  FontWeight regular = FontWeight.w400;
  FontWeight light = FontWeight.w300;
  FontWeight extraLight = FontWeight.w200;

  List<MoodType> get moodTypes => [
    MoodType('happy', 'Senang', moodHappy),
    MoodType('sad', 'Sedih', moodSad),
    MoodType('angry', 'Marah', moodAngry),
    MoodType('calm', 'Tenang', moodCalm),
    MoodType('anxious', 'Cemas', moodAnxious),
    MoodType('excited', 'Bersemangat', moodExcited),
  ];

  MoodType moodByKey(String key) =>
      moodTypes.firstWhere((m) => m.key == key, orElse: () => moodTypes.first);
}

class MoodType {
  final String key;
  final String label;
  final Color color;
  const MoodType(this.key, this.label, this.color);
  String get asset => 'assets/mood_$key.svg';
}
