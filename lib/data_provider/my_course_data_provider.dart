

import 'package:e_learning/model/my_course.dart';

import '../model/course.dart';

class MyCourseDataProvider{
  static final List<MyCourse> _myCourse =[];


  static void addCourse( Course course){
    _myCourse.add(MyCourse(course));
  }


  static void addAllCourses(List<Course> cources){
    for(var course in cources){
      _myCourse.add(MyCourse(course));
    }
  }

  static List<MyCourse> get myCourses =>_myCourse;

}