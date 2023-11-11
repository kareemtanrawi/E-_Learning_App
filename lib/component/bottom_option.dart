import 'package:e_learning/constants.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomOption extends StatelessWidget {
  const BottomOption({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                openScreen(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home,
                      color: getSelectedColor(1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Home',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 13,
                        color: getSelectedColor(1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.play_circle_outline,
                      color: getSelectedColor(2),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'My Cources',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 13,
                        color: getSelectedColor(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 3);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: getSelectedColor(3),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Wishlist',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 13,
                        color: getSelectedColor(3),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 4);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.people,
                      color: getSelectedColor(4),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Account',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 13,
                        color: getSelectedColor(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSelectedColor(int optionIndex) {
    return (selectedIndex == optionIndex)
        ? kPrimaryColor
        : Colors.grey.shade800;
  }

  void openScreen(BuildContext context, int selectedOptionNo) {
    String routeName = RoutesName.courceHome;
    switch (selectedOptionNo) {
      case 2:
        routeName = RoutesName.myCourseList;
        break;

      case 3:
        routeName = RoutesName.wishlist;
        break;
    }
    Navigator.pushReplacementNamed(context, routeName);
  }
}
