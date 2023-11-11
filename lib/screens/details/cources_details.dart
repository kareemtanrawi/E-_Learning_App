import 'package:e_learning/constants.dart';
import 'package:e_learning/model/course.dart';
import 'package:e_learning/model/section.dart';
import 'package:e_learning/screens/details/widget/favourite_option.dart';
import 'package:e_learning/util/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../data_provider/shopping_cart_data_provider.dart';

class CourcesDetails extends StatelessWidget {
  const CourcesDetails({super.key, required this.cource});

  final Course cource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      Util.openShoppingCart(context);
                                    },
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: Image.asset(cource.thumbnailUrl)),
                            Column(
                              children: [
                                const Icon(
                                  Icons.play_arrow,
                                  size: 90,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Preview This Course',
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cource.title,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                  ),
                                  // const SizedBox(
                                  // width: 10,
                                  // ),
                                  Text(
                                    cource.createdBy,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 16, color: kPrimaryColor),
                                  ),
                                  FavouriteOption(cource: cource),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.play_circle_outline),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${cource.lessonNo} Lesoons',
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.grey.shade800,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        cource.duration,
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.grey.shade800,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 25,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${cource.rate}',
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.grey.shade800,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ReadMoreText(
                                cource.description,
                                trimLines: 2,
                                trimMode: TrimMode.Line,
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Course Content',
                                    style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    '(${cource.sections.length} Sections)',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cource.sections.length,
                                itemBuilder: (context, index) {
                                  return buildCourseContent(index);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${cource.price}",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 25,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                            ),
                            onPressed: () {
                              String message =
                                  'Course is already added into cart';
                              if (!ShoppingCartDataProvider
                                  .shoppingCartCourseList
                                  .contains(cource)) {
                                message = 'Course added to cart';
                                ShoppingCartDataProvider.addCourse(cource);
                              }
                              Util.showMessageWithAction(
                                  context, message, "View", () {
                                Util.openShoppingCart(context);
                              });

                            },

                            child: Text(
                              'Add to Cart',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Buy',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCourseContent(int index) {
    Section section = cource.sections[index];
    return ExpansionTile(
      title: Text(
        "Section ${index + 1} - ${section.name}",
        style: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: section.lectures.map((lecture) {
        return ListTile(
          dense: true,
          onTap: () {},
          leading: const SizedBox(),
          title: Text(
            lecture.name,
            style: GoogleFonts.aBeeZee(),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                lecture.duration,
                style: GoogleFonts.aBeeZee(
                    color: Colors.grey.shade500, fontSize: 15),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
