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
  final List<Widget> _screens = [
    const HomeScreen(),
    const AsmaulHusnaScreen(),
    const JadwalSholatScreen(),
    const DoaScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
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
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 1,
          onTap: (int i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: _currentIndex == 0
                    ? const ColorFilter.mode(
                        Color(0xFF672CBC),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFF8789A3),
                        BlendMode.srcIn,
                      ),
              ),
              label: "Al-Quran",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/lampu.svg',
                colorFilter: _currentIndex == 1
                    ? const ColorFilter.mode(
                        Color(0xFF672CBC),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFF8789A3),
                        BlendMode.srcIn,
                      ),
              ),
              label: "Asmaul Husna",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/sholat.svg',
                colorFilter: _currentIndex == 2
                    ? const ColorFilter.mode(
                        Color(0xFF672CBC),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFF8789A3),
                        BlendMode.srcIn,
                      ),
              ),
              label: "Jadwal Sholat",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/doa.svg',
                colorFilter: _currentIndex == 3
                    ? const ColorFilter.mode(
                        Color(0xFF672CBC),
                        BlendMode.srcIn,
                      )
                    : const ColorFilter.mode(
                        Color(0xFF8789A3),
                        BlendMode.srcIn,
                      ),
              ),
              label: "Doa",
            ),
          ],
        ),
      ),
    );
  }
}
