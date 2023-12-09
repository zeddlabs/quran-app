import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran.dart';
import 'package:quran_app/widgets/surah_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Surah> _allSurahs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    QuranService.getSurahs().then((value) {
      setState(() {
        _allSurahs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AlQurania",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF672CBC),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Assalamualaikum",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8789A3),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Saudaraku",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF240F4F),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFDF98FA),
                                Color(0xFF9055FF),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/last_read.svg'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "QS. Al-Israa 9",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  "\"Sesungguhnya Al-Quran itu memberi petunjuk kepada jalan yang lebih lurus.\"",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SvgPicture.asset('assets/images/quran.svg'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF672CBC),
                            width: 3,
                          ),
                        ),
                      ),
                      child: Text(
                        "Surah",
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF672CBC),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    _allSurahs.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SurahItem(
                                surahNumber: _allSurahs[index].surahNumber,
                                surahName: _allSurahs[index].surahName,
                                type: _allSurahs[index].type,
                                ayahCount: _allSurahs[index].ayahCount,
                                arabicName: _allSurahs[index].arabicName,
                              );
                            },
                            itemCount: _allSurahs.length,
                          )
                        : const Text("Loading...")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
