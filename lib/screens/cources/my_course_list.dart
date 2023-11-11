import 'package:e_learning/component/bottom_option.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/data_provider/my_course_data_provider.dart';
import 'package:e_learning/model/my_course.dart';
import 'package:e_learning/screens/shopping/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList = MyCourseDataProvider.myCourses;
    if (myCourseList.isNotEmpty) {
      myCourseList[1].progress = 50;
      myCourseList[2].progress = 20;
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'My Courses',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'All Courses',
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Downloaded Courses',
                            style: GoogleFonts.aBeeZee(
                              // color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Archived Courses',
                            style: GoogleFonts.aBeeZee(
                              // color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: myCourseList.length,
                  itemBuilder: (context, index) {
                    MyCourse myCourse = myCourseList[index];
                    getMyCourse(myCourse, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ShoppingCartScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomOption(selectedIndex: 2,),
    );
  }

  Widget getMyCourse(MyCourse myCourse, BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(
          myCourse.course.title,
          maxLines: 2,
          style: GoogleFonts.aBeeZee(
            fontSize: 17,
            color: Colors.grey.shade800,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myCourse.course.createdBy,
              style: GoogleFonts.aBeeZee(
                color: Colors.grey.shade500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: myCourse.progress > 0,
              replacement: Text('Start Courses', style: GoogleFonts.aBeeZee(
                color: kBlueColor,
                fontWeight: FontWeight.bold,

              ),),
              child: Row(
                children: [
                  Expanded(child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbColor: Colors.transparent,

                      overlayShape: SliderComponentShape.noThumb,
                      thumbShape: SliderComponentShape.noThumb,
                    ),

                    child: Slider(
                      min: 0,
                      max: 100,
                      value:myCourse.progress.toDouble(),
                      onChanged: (val){

                      },),
                  ),),
                  const SizedBox(width: 10,),
                  Text("${myCourse.progress}%"),
                ],
              ),),
            Text(
              'Start Course',
              style: GoogleFonts.aBeeZee(
                color: kBlueColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
