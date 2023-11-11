import 'package:e_learning/component/bottom_option.dart';
import 'package:e_learning/component/shopping_cart_opinion.dart';

// import '..\..\component\bottom_option.dart';
// import '..\..\component\shopping_cart_opinion.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/screens/home/widgets/category_cource_list.dart';
import 'package:e_learning/screens/home/widgets/category_list.dart';
import 'package:e_learning/screens/home/widgets/cource_list.dart';
import 'package:e_learning/screens/home/widgets/feature_cources.dart';
import 'package:e_learning/screens/home/widgets/header.dart';
import 'package:e_learning/screens/home/widgets/offers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/cource_search.dart';

class CourcesHome extends StatelessWidget {
  const CourcesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Header(),
                      SizedBox(
                        height: 20,
                      ),
                      CourceSearch(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Offers(),
                    const FeatureCources(),
                    CategoryCourceList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: const ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(selectedIndex: 1),
    );
  }
}
