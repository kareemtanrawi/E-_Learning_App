import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/model/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: courseList.length,
        itemBuilder: (context , index){
      Course course = courseList[index];
    });
  }

  List<Course> getCourseList(BuildContext context) {
    return CourseDataProvider.courseList
        .where((course) => course.isFavorite)
        .toList();
  }


  Widget getListItem(Course course){
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl)
        ,
      ),
    );
  }
}
