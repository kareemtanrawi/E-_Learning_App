import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourceSearch extends StatelessWidget {
  const CourceSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Search for cources',
        hintStyle: GoogleFonts.aBeeZee(color: Colors.grey.shade400),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.search,
            size: 20,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
    );
  }
}
