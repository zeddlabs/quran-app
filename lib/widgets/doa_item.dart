import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoaItem extends StatelessWidget {
  final String id;
  final String name;
  final String verse;
  final String latin;
  final String translation;

  const DoaItem({
    super.key,
    required this.id,
    required this.name,
    required this.verse,
    required this.latin,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: const Color(0xFFBBC4CE).withOpacity(0.35),
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF121931).withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF863ED5),
                  radius: 17,
                  child: Text(
                    id,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    name,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF863ED5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            verse,
            style: GoogleFonts.amiri(
              color: const Color(0xFF240F4F),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            latin,
            style: GoogleFonts.poppins(
              color: const Color(0xFF240F4F).withOpacity(0.75),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "\"$translation\"",
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
  }
}
