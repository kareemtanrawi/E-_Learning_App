import 'package:e_learning/model/course_category.dart';
import 'package:flutter/material.dart';

class courceCategoryChangeNotifier extends ChangeNotifier {
  CourseCategory _category = CourseCategory.all;

  CourseCategory get category => _category;

  void changeCategory(CourseCategory category) {
    _category = category;
    notifyListeners();
  }
}
