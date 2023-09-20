import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/jadwal_sholat.dart';
import 'package:quran_app/services/jadwal_sholat.dart';
import 'package:quran_app/widgets/jadwal_sholat_item.dart';

class DetailJadwalSholatScreen extends StatefulWidget {
  final String cityId;
  final String cityName;

  const DetailJadwalSholatScreen({
    super.key,
    required this.cityId,
    required this.cityName,
  });

  @override
  State<DetailJadwalSholatScreen> createState() =>
      _DetailJadwalSholatScreenState();
}

class _DetailJadwalSholatScreenState extends State<DetailJadwalSholatScreen> {
  JadwalSholat? _jadwalSholat;
  final DateTime _now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    JadwalSholatService.getJadwalSholat(
      widget.cityId,
      _now.year,
      _now.month,
      _now.day,
    ).then((value) {
      setState(() {
        _jadwalSholat = value;
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
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
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
                      "Detail Jadwal Sholat",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF672CBC),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _jadwalSholat != null ? _jadwalSholat!.date : "",
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
                      widget.cityName,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF240F4F),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Divider(
                        color: Color(0xFF8789A3),
                      ),
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
                        "Jadwal",
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
                    _jadwalSholat != null
                        ? ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              JadwalSholatItem(
                                name: "Subuh",
                                time: _jadwalSholat!.subuh,
                              ),
                              JadwalSholatItem(
                                name: "Dzuhur",
                                time: _jadwalSholat!.dzuhur,
                              ),
                              JadwalSholatItem(
                                name: "Ashar",
                                time: _jadwalSholat!.ashar,
                              ),
                              JadwalSholatItem(
                                name: "Maghrib",
                                time: _jadwalSholat!.maghrib,
                              ),
                              JadwalSholatItem(
                                name: "Isya",
                                time: _jadwalSholat!.isya,
                              ),
                            ],
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
