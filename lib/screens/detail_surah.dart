import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran.dart';
import 'package:quran_app/widgets/ayah_item.dart';

class DetailSurahScreen extends StatefulWidget {
  final int surahNumber;

  const DetailSurahScreen({
    super.key,
    required this.surahNumber,
  });

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  Surah? surah;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    QuranService.getSurah(widget.surahNumber).then((value) {
      setState(() {
        surah = value;
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
                  top: 24,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      surah != null ? surah!.surahName : "",
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
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: surah != null
                    ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFDF98FA),
                                    Color(0xFF9055FF),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFF9055FF),
                                    offset: Offset(0, 20),
                                    blurRadius: 32,
                                    spreadRadius: -16,
                                  )
                                ]),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Opacity(
                                    opacity: 0.2,
                                    child: SvgPicture.asset(
                                      'assets/images/quran.svg',
                                      height: 160,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 28,
                                    horizontal: 56,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        surah!.surahName,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        surah!.translation,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Divider(
                                        color: Colors.white.withOpacity(0.35),
                                        thickness: 1,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            surah!.type.toUpperCase(),
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.circle,
                                            size: 4,
                                            color:
                                                Colors.white.withOpacity(0.35),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            surah != null
                                                ? "${surah!.ayahCount} Ayat"
                                                    .toUpperCase()
                                                : ''.toUpperCase(),
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32,
                                      ),
                                      SvgPicture.asset(
                                          'assets/images/bismillah.svg'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return AyahItem(
                                ayahNumber: surah!.ayahs![index].ayahNumber,
                                text: surah!.ayahs![index].text,
                                read: surah!.ayahs![index].read,
                                translation: surah!.ayahs![index].translation,
                              );
                            },
                            itemCount: surah!.ayahCount,
                          ),
                        ],
                      )
                    : const Text("Loading..."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
