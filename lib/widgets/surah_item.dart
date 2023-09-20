import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/screens/detail_surah.dart';

class SurahItem extends StatelessWidget {
  final int surahNumber;
  final String surahName;
  final String type;
  final int ayahCount;
  final String arabicName;

  const SurahItem({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.type,
    required this.ayahCount,
    required this.arabicName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailSurahScreen(
              surahNumber: surahNumber,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFFBBC4CE).withOpacity(0.35),
            ),
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/icons/border_ayat.svg'),
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Text(
                      surahNumber.toString(),
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF240F4F),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surahName,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF240F4F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        type.toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF8789A3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.circle,
                        size: 4,
                        color: const Color(0xFFBBC4CE).withOpacity(
                          0.35,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "$ayahCount Ayat".toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF8789A3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              arabicName,
              style: GoogleFonts.amiri(
                color: const Color(0xFF863ED5),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
