import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';
import 'package:mood_tracker/model/mood.dart';
import 'package:mood_tracker/pages/add_page.dart';
import 'package:mood_tracker/services/mood_service.dart';
import 'package:mood_tracker/widgets/mood_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  Widget _title(String text) => Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 12),
    child: Text(
      text,
      style: TextStyle(fontSize: 15, fontWeight: Global().semiBold),
    ),
  );

  Widget _card(Mood m) => MoodCard(
    mood: Global().moodByKey(m.mood),
    subtitle: "${DateFormat('HH:mm').format(m.date)} · ${m.notes}",
    onEdit: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPage(mood: m)),
    ),
    onDelete: () => m.delete(),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        "Halo, Zika 👋",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: Global().semiBold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Bagaimana perasaanmu hari ini?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: Global().regular,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Global().primarySubtle,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "Z",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: Global().semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Global().primarySubtle,
                    borderRadius: BorderRadius.circular(300),
                  ),
                  child: Text(
                    "🔥  5 hari berturut-turut mencatat mood",
                    style: TextStyle(fontSize: 12, color: Global().primary),
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: MoodService.box.listenable(),
                  builder: (context, box, _) {
                    final moods = box.values.toList()
                      ..sort((a, b) => b.date.compareTo(a.date));

                    final now = DateTime.now();
                    final yesterdayDate = now.subtract(const Duration(days: 1));

                    final today = moods
                        .where((m) => _isSameDay(m.date, now))
                        .toList();
                    final yesterday = moods
                        .where((m) => _isSameDay(m.date, yesterdayDate))
                        .toList();

                    return ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        if (today.isNotEmpty) ...[
                          _title("Hari Ini"),
                          ...today.map(_card),
                        ],
                        if (yesterday.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          _title("Kemarin"),
                          ...yesterday.map(_card),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddPage()),
        ),
        backgroundColor: Global().primary,
        elevation: 0,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: Global().textOnPrimary),
      ),
    );
  }
}
