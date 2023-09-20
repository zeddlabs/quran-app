import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/models/doa.dart';
import 'package:quran_app/services/doa.dart';
import 'package:quran_app/widgets/doa_item.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({super.key});

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  List<Doa> _allDoa = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DoaService.getDoa().then((value) {
      setState(() {
        _allDoa = value;
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
                      "Doa Sehari-Hari",
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
                child: _allDoa.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return DoaItem(
                            id: _allDoa[index].id,
                            name: _allDoa[index].name,
                            verse: _allDoa[index].verse,
                            latin: _allDoa[index].latin,
                            translation: _allDoa[index].translation,
                          );
                        },
                        itemCount: _allDoa.length,
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
