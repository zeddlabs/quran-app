import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/screens/asmaul_husna.dart';
import 'package:quran_app/screens/doa.dart';
import 'package:quran_app/screens/home.dart';
import 'package:quran_app/screens/jadwal_sholat.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const AsmaulHusnaScreen(),
    const JadwalSholatScreen(),
    const DoaScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: const Color(0xFFBAB0CE).withOpacity(0.2),
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          onTap: (int i) {
            setState(() {
              currentIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/quran.svg',
                color: currentIndex == 0
                    ? const Color(0xFF672CBC)
                    : const Color(0xFF8789A3),
              ),
              label: "Al-Quran",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/lampu.svg',
                color: currentIndex == 1
                    ? const Color(0xFF672CBC)
                    : const Color(0xFF8789A3),
              ),
              label: "Asmaul Husna",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/sholat.svg',
                color: currentIndex == 2
                    ? const Color(0xFF672CBC)
                    : const Color(0xFF8789A3),
              ),
              label: "Jadwal Sholat",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/doa.svg',
                color: currentIndex == 3
                    ? const Color(0xFF672CBC)
                    : const Color(0xFF8789A3),
              ),
              label: "Doa",
            ),
          ],
        ),
      ),
    );
  }
}
