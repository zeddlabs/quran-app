import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/asmaul_husna.dart';
import 'package:quran_app/services/asmaul_husna.dart';
import 'package:quran_app/widgets/asmaul_husna_item.dart';

class AsmaulHusnaScreen extends StatefulWidget {
  const AsmaulHusnaScreen({super.key});

  @override
  State<AsmaulHusnaScreen> createState() => _AsmaulHusnaScreenState();
}

class _AsmaulHusnaScreenState extends State<AsmaulHusnaScreen> {
  List<AsmaulHusna> allAsmaulHusna = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AsmaulHusnaService.getAsmaulHusna().then((value) {
      setState(() {
        allAsmaulHusna = value;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                    Text(
                      "Asmaul Husna",
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF672CBC),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: allAsmaulHusna.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AsmaulHusnaItem(
                            order: allAsmaulHusna[index].order,
                            latin: allAsmaulHusna[index].latin,
                            arabic: allAsmaulHusna[index].arabic,
                            translation: allAsmaulHusna[index].translation,
                          );
                        },
                        itemCount: allAsmaulHusna.length,
                      )
                    : const Text("Loading..."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
