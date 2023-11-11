import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/model/course.dart';
import 'package:e_learning/screens/home/widgets/cource_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCources extends StatelessWidget {
  const FeatureCources({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> featuredCourcesList = [
      CourseDataProvider.courseList[9],
      CourseDataProvider.courseList[0],
      CourseDataProvider.courseList[1],
      CourseDataProvider.courseList[2],
      CourseDataProvider.courseList[10],
      CourseDataProvider.courseList[5],
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Feature Cources',
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'See All',
                style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourcesList.length,
            itemBuilder: (context, index) {
              Course course = featuredCourcesList[index];
              return CourceItem(
                course: course,
              );
            },
          ),
        )
      ],
    );
  }
}
