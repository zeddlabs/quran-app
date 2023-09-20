import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JadwalSholatItem extends StatelessWidget {
  final String name;
  final String time;

  const JadwalSholatItem({
    super.key,
    required this.name,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.poppins(
                color: const Color(0xFF240F4F),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            time,
            style: GoogleFonts.poppins(
              color: const Color(0xFF863ED5),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
