// import 'dart:js';

import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/model/course.dart';
import 'package:e_learning/model/course_category.dart';
import 'package:e_learning/notifier/cource_category_notifier.dart';
import 'package:e_learning/screens/home/widgets/cource_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CourceList extends StatelessWidget {
  const CourceList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: getCourseList(context).map((course) {
        return CourceItem(course: course);
      }).toList(),
    );
  }

  List<Course> getCourseList(BuildContext context) {
    var category = Provider.of<courceCategoryChangeNotifier>(context).category;

    if (category == CourseCategory.all) {
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList
        .where((course) => course.courseCategory == category)
        .toList();
  }
}
