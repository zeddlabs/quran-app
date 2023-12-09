import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AyahItem extends StatefulWidget {
  final int ayahNumber;
  final String text;
  final String read;
  final String translation;
  final String audio;
  final int lastReadAyah;

  const AyahItem({
    super.key,
    required this.ayahNumber,
    required this.text,
    required this.read,
    required this.translation,
    required this.audio,
    required this.lastReadAyah,
  });

  @override
  State<AyahItem> createState() => _AyahItemState();
}

class _AyahItemState extends State<AyahItem> {
  late SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      _prefs = prefs;
    });
  }

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
            padding: const EdgeInsets.only(left: 12),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF121931).withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF863ED5),
                  radius: 17,
                  child: Text(
                    widget.ayahNumber.toString(),
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
                      icon: SvgPicture.asset('assets/icons/share.svg'),
                    ),
                    IconButton(
                      onPressed: () {
                        AudioPlayer().play(UrlSource(widget.audio));
                      },
                      icon: SvgPicture.asset('assets/icons/play.svg'),
                    ),
                    IconButton(
                      onPressed: () {
                        if (widget.lastReadAyah == widget.ayahNumber) {
                          _prefs.setInt('lastReadAyah', 0);
                        } else {
                          _prefs.setInt('lastReadAyah', widget.ayahNumber);
                        }
                      },
                      icon: widget.lastReadAyah == widget.ayahNumber
                          ? const Icon(
                              Icons.bookmark,
                              color: Color(0xFF863ED5),
                            )
                          : const Icon(
                              Icons.bookmark_border,
                              color: Color(0xFF863ED5),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            widget.text,
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
            widget.read,
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
            "\"${widget.translation}\"",
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
