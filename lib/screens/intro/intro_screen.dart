import 'package:e_learning/constants.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/intro/intro.png'),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Grow Your Skills',
            style: GoogleFonts.aBeeZee(
              fontSize: 25,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Choose Your Favourite Cources & Start learning",
            style: GoogleFonts.aBeeZee(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.courceHome);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Text(
                'Getting Started',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
