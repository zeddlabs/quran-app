import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/imam.dart';
import 'package:quran_app/models/surah.dart';
import 'package:quran_app/services/quran.dart';
// import 'package:quran_app/widgets/ayah_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Surah? _surah;
  List<Imam> _imams = [];
  int _selectedImam = 1;
  String? _lastReadAyah;

  late SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;

      setState(() {
        _lastReadAyah = _prefs.getString('lastReadAyah');
      });
    });

    QuranService.getSurah(widget.surahNumber, _selectedImam).then((value) {
      setState(() {
        _surah = value;
      });
    });

    QuranService.getImams().then((value) {
      setState(() {
        _imams = value;
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
                      _surah != null ? _surah!.surahName : "",
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Mau Qori Yang Mana?",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF8789A3),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      value: _selectedImam,
                      onChanged: (value) {
                        setState(() {
                          _selectedImam = value as int;
                        });

                        QuranService.getSurah(widget.surahNumber, _selectedImam)
                            .then((value) {
                          setState(() {
                            _surah = value;
                          });
                        });
                      },
                      items: _imams.map((item) {
                        return DropdownMenuItem(
                          value: item.id,
                          child: Text(
                            item.name,
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF240F4F),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _surah != null
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
                                        _surah!.surahName,
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
                                        _surah!.translation,
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
                                            _surah!.type.toUpperCase(),
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
                                            _surah != null
                                                ? "${_surah!.ayahCount} Ayat"
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
                              // return AyahItem(
                              //   ayahNumber: _surah!.ayahs![index].ayahNumber,
                              //   text: _surah!.ayahs![index].text,
                              //   read: _surah!.ayahs![index].read,
                              //   translation: _surah!.ayahs![index].translation,
                              //   audio: _surah!.ayahs![index].audio,
                              //   lastReadAyah: _lastReadAyah,
                              // );
                              return Container(
                                padding: const EdgeInsets.only(bottom: 16),
                                margin: const EdgeInsets.only(bottom: 24),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color:
                                      const Color(0xFFBBC4CE).withOpacity(0.35),
                                ))),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 12),
                                      margin: const EdgeInsets.only(bottom: 24),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF121931)
                                            .withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor:
                                                const Color(0xFF863ED5),
                                            radius: 17,
                                            child: Text(
                                              _surah!.ayahs![index].ayahNumber
                                                  .toString(),
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: SvgPicture.asset(
                                                    'assets/icons/share.svg'),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  AudioPlayer().play(UrlSource(
                                                      _surah!.ayahs![index]
                                                          .audio));
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/icons/play.svg'),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (_lastReadAyah ==
                                                      "${widget.surahNumber}-${_surah!.ayahs![index].ayahNumber}") {
                                                    _prefs.setString(
                                                        'lastReadAyah', "0-0");
                                                  } else {
                                                    _prefs.setString(
                                                        'lastReadAyah',
                                                        "${widget.surahNumber}-${_surah!.ayahs![index].ayahNumber}");
                                                  }

                                                  setState(() {
                                                    _lastReadAyah =
                                                        _prefs.getString(
                                                                'lastReadAyah') ??
                                                            "0-0";
                                                  });
                                                },
                                                icon: _lastReadAyah ==
                                                        "${widget.surahNumber}-${_surah!.ayahs![index].ayahNumber}"
                                                    ? const Icon(
                                                        Icons.bookmark,
                                                        color:
                                                            Color(0xFF863ED5),
                                                      )
                                                    : const Icon(
                                                        Icons.bookmark_border,
                                                        color:
                                                            Color(0xFF863ED5),
                                                      ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      _surah!.ayahs![index].text,
                                      style: GoogleFonts.amiri(
                                        color: const Color(0xFF240F4F),
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        height: 2,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      _surah!.ayahs![index].read,
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF240F4F)
                                            .withOpacity(0.75),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\"${_surah!.ayahs![index].translation}\"",
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF240F4F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: _surah!.ayahCount,
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
