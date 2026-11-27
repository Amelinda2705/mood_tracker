import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';
import 'package:mood_tracker/pages/onboarding_page.dart';
import 'package:mood_tracker/services/mood_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await initializeDateFormatting('id_ID', '');
  await MoodService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Global().surface,
      ),

      home: OnBoardingPage(),
    );
  }
}
