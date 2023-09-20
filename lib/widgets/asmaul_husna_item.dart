import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AsmaulHusnaItem extends StatelessWidget {
  final int order;
  final String latin;
  final String arabic;
  final String translation;

  const AsmaulHusnaItem({
    super.key,
    required this.order,
    required this.latin,
    required this.arabic,
    required this.translation,
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
          Stack(
            children: [
              SvgPicture.asset('assets/icons/border_ayat.svg'),
              SizedBox(
                width: 36,
                height: 36,
                child: Center(
                  child: Text(
                    order.toString(),
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
                  latin,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF240F4F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  translation,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF8789A3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            arabic,
            style: GoogleFonts.amiri(
              color: const Color(0xFF863ED5),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
