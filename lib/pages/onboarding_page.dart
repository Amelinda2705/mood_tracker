import 'dart:math' as math;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mood_tracker/commons/global.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  List<String> titles = [
    "Kenali Setiap Perasaanmu",
    "Catat Mood dalam Hitungan Detik",
    "Temukan Pola & Pemicunya",
  ];

  List<String> desc = [
    "Setiap mood yang kamu rasakan itu berharga. Catat, pahami, dan rayakan perjalanan emosimu.",
    "Pilih mood, tambahkan catatan singkat, dan selesai. Secepat itu untuk mengenal dirimu lebih baik.",
    "Lihat tren emosimu dari waktu ke waktu dan pahami apa yang memengaruhi harimu.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                carouselController.animateToPage(2);
              },
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
              ),
              child: Text(
                currentIndex == 2 ? "" : "Lewati",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: Global().medium,
                  color: Global().textSecondary,
                ),
              ),
            ),
          ),
          CarouselSlider(
            items: [
              // Image: Page 1
              SizedBox(
                height: 380,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -60,
                      top: 0,
                      child: Container(
                        width: 220,
                        height: 220,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Global().moodExcited,
                          borderRadius: BorderRadius.circular(110),
                        ),
                        padding: EdgeInsets.only(right: 51),
                        child: SvgPicture.asset(
                          'assets/mood_excited.svg',
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    Positioned(
                      right: -50,
                      bottom: 0,
                      child: Container(
                        width: 220,
                        height: 220,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Global().moodCalm,
                          borderRadius: BorderRadius.circular(110),
                        ),
                        child: SvgPicture.asset(
                          'assets/mood_calm.svg',
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 128,
                        height: 128,
                        decoration: BoxDecoration(
                          color: Global().moodHappy,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: SvgPicture.asset('assets/mood_happy.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // Image: Page 2
              SizedBox(
                height: 370,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -50,
                      bottom: 0,
                      child: Container(
                        width: 160,
                        height: 160,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Global().moodSad,
                          borderRadius: BorderRadius.circular(110),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -60,
                      top: 0,
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Global().moodHappy,
                          borderRadius: BorderRadius.circular(110),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 83,
                      child: Transform.rotate(
                        angle: -6 * math.pi / 180,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: Global().moodHappy,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: SvgPicture.asset('assets/mood_happy.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 67.75,
                      bottom: 200,
                      child: Transform.rotate(
                        angle: 8 * math.pi / 180,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: Global().moodCalm,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: SvgPicture.asset('assets/mood_calm.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80,
                      bottom: 92,
                      child: Transform.rotate(
                        angle: -5 * math.pi / 180,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: Global().moodSad,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: SvgPicture.asset('assets/mood_sad.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      right: 92,
                      child: Transform.rotate(
                        angle: 6 * math.pi / 180,
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: Global().moodExcited,
                            borderRadius: BorderRadius.circular(31),
                          ),
                          child: SvgPicture.asset('assets/mood_excited.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Image: Page 3
              SizedBox(
                height: 365,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: -59,
                      bottom: 0,
                      child: Container(
                        width: 170,
                        height: 170,
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Global().moodAngry,
                          borderRadius: BorderRadius.circular(110),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      left: -70,
                      child: Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Global().moodAnxious,
                          borderRadius: BorderRadius.circular(110),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 24,
                      left: 63,
                      child: Transform.rotate(
                        angle: 6 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodHappy,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: SvgPicture.asset('assets/mood_happy.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 160,
                      child: Transform.rotate(
                        angle: -4 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodSad,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: SvgPicture.asset('assets/mood_sad.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 29,
                      right: 76,
                      child: Transform.rotate(
                        angle: 4 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodAngry,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: SvgPicture.asset('assets/mood_angry.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 70,
                      bottom: 177,
                      child: Transform.rotate(
                        angle: -5 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodCalm,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: SvgPicture.asset('assets/mood_calm.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 146,
                      left: 154,
                      child: Transform.rotate(
                        angle: 5 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodAnxious,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: SvgPicture.asset('assets/mood_anxious.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 177,
                      right: 69,
                      child: Transform.rotate(
                        angle: -6 * math.pi / 180,
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Global().moodExcited,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: SvgPicture.asset('assets/mood_excited.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            carouselController: carouselController,
          ),
          const SizedBox(height: 100),
          Text(
            titles[currentIndex],
            style: TextStyle(
              color: Global().textPrimary,
              fontSize: 22,
              fontWeight: Global().semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            desc[currentIndex],
            style: TextStyle(
              color: Global().textSecondary,
              fontSize: 14,
              fontWeight: Global().regular,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 84),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                width: currentIndex == 0 ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: currentIndex == 0
                      ? Global().primary
                      : Global().borderDefault,
                ),
              ),
              Container(
                width: currentIndex == 1 ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: currentIndex == 1
                      ? Global().primary
                      : Global().borderDefault,
                ),
              ),
              Container(
                width: currentIndex == 2 ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: currentIndex == 2
                      ? Global().primary
                      : Global().borderDefault,
                ),
              ),
            ],
          ),
          SizedBox(height: 104),
          TextButton(
            onPressed: () {
              if (currentIndex == 2) {
              } else {
                carouselController.nextPage();
              }
            },
            child: Container(
              width: 342,
              height: 48,
              decoration: BoxDecoration(
                color: Global().primary,
                borderRadius: BorderRadius.circular(300),
              ),
              child: Center(
                child: Text(
                  currentIndex == 2 ? "Mulai Sekarang" : "Lanjut",
                  style: TextStyle(fontSize: 16, color: Global().textOnPrimary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
