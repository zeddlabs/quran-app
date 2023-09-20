import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/screens/detail_jadwal_sholat.dart';

class CityItem extends StatelessWidget {
  final int number;
  final String id;
  final String city;

  const CityItem({
    super.key,
    required this.number,
    required this.id,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailJadwalSholatScreen(
              cityId: id,
              cityName: city,
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
                      number.toString(),
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
              child: Text(
                city,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF240F4F),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
