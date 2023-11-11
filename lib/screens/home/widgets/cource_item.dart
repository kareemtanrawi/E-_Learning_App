import 'package:e_learning/arguments/coyrces_argument.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/course.dart';

class CourceItem extends StatelessWidget {
  const CourceItem({super.key, required this.course});
  final Course course;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutesName.courceDetails,
                arguments: CoursesArgument(course),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(course.thumbnailUrl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            color: kBlueColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              course.createdBy,
                              style: GoogleFonts.aBeeZee(
                                fontSize: 10,
                                color: kBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      // height: 2,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                                color: kRatingColor,
                              ),
                              // const SizedBox(
                              // width: 5,
                              // ),
                              Text(
                                '${course.rate}',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${course.price}',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 10,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
