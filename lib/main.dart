import 'package:e_learning/arguments/checkout_argument.dart';
import 'package:e_learning/arguments/coyrces_argument.dart';
import 'package:e_learning/screens/cources/my_course_list.dart';
import 'package:e_learning/screens/cources/wishlist_screen.dart';
import 'package:e_learning/screens/details/cources_details.dart';
import 'package:e_learning/screens/home/cources_home.dart';
import 'package:e_learning/screens/intro/intro_screen.dart';
import 'package:e_learning/screens/shopping/checkout_screen.dart';
import 'package:e_learning/screens/shopping/shopping_cart_screen.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ElearningApp());
}

class ElearningApp extends StatelessWidget {
  const ElearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        RoutesName.intro: (context) => const IntroScreen(),
        RoutesName.courceHome: (context) => const CourcesHome(),
        RoutesName.ShoppingCart: (context) => const ShoppingCartScreen(),
        RoutesName.myCourseList: (context) => const MyCourseList(),
        RoutesName.wishlist :(context)=>const WishlistScreen(),

      },
      onGenerateRoute: (setting) {
        if (setting.name == RoutesName.courceDetails) {
          final argc = setting.arguments as CoursesArgument;
          return MaterialPageRoute(
            builder: (context) => CourcesDetails(cource: argc.course),
          );
        } else if (setting.name == RoutesName.checkout) {
          final argc = setting.arguments as CheckoutArgument;
          return MaterialPageRoute(
            builder: (context) => CheckoutScreen(
              courseList: argc.courseList,
              totalPrice: argc.totalPrice,
            ),
          );
        }
      },
      // home: Scaffold(),
    );
  }
}
