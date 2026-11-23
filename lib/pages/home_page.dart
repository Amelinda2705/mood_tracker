import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                        "Halo, Zika",
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
                        "z",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Hari Ini",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: Global().semiBold,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Global().surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Global().primary.withValues(alpha: 0.16),
                          blurRadius: 16,
                          spreadRadius: 0,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      spacing: 16,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Global().moodExcited,
                            borderRadius: BorderRadius.circular(110),
                          ),
                          child: SvgPicture.asset(
                            'assets/mood_excited.svg',
                            height: 70,
                            width: 70,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          spacing: 4,
                          children: [
                            Text(
                              "Bersemangat",
                              style: TextStyle(
                                fontWeight: Global().medium,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "14:20 · Dapat kabar baik dari klien, semangat banget!",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: Global().regular,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/more.svg',
                          height: 32,
                          width: 32,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: SafeArea(
      //   child: Container(
      //     width: 56,
      //     height: 56,
      //     decoration: BoxDecoration(
      //       color: Global().primary,
      //       borderRadius: BorderRadius.circular(100),
      //     ),
      //     child: Padding(
      //       padding: EdgeInsets.all(16),
      //       child: ElevatedButton(
      //         onPressed: () {},
      //         child: SvgPicture.asset('assets/plus.svg', height: 24, width: 24),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
