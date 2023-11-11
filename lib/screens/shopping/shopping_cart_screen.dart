import 'package:e_learning/arguments/checkout_argument.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/course.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotla();
    List<Course> CartCourseList =
        ShoppingCartDataProvider.shoppingCartCourseList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Shopping cart',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Text(
                        "Total :",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "\$$totalAmount",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Promotion',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Promo Code",
                              hintStyle: GoogleFonts.aBeeZee(),
                              filled: true,
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                              ),
                              onPressed: () {},
                              child: Text(
                                'Apply',
                                style: GoogleFonts.aBeeZee(),
                              )),
                        )
                      ],
                    ),
                    Text(
                      "${CartCourseList.length} Courses in List",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: CartCourseList.length,
                      itemBuilder: (context, index) {
                        return createShoppingCartItem(index);
                      },
                    )
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10 , left: 20 , right: 20),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                onPressed: (){
                  Navigator.pushNamed(context, RoutesName.checkout, arguments: CheckoutArgument(CartCourseList, totalAmount));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50 , vertical: 10),
                  child: Text('Checkout' , style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateTotla() {
    return ShoppingCartDataProvider.shoppingCartCourseList
        .fold(0, (old, course) => old + course.price);
  }

  Widget createShoppingCartItem(int index) {
    Course cource = ShoppingCartDataProvider.shoppingCartCourseList[index];
    return Card(
      child: ListTile(
        leading: Image.asset(cource.thumbnailUrl),
        title: Text(
          cource.title,
          maxLines: 2,
          style: GoogleFonts.aBeeZee(fontSize: 17, color: Colors.grey.shade700),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${cource.createdBy}",
              style: GoogleFonts.aBeeZee(color: kPrimaryColor, fontSize: 13),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  cource.duration,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(width: 10,),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey ,
                  child: Container(),
                ),
                const SizedBox(width: 10,),
                Text(
                  "${cource.lessonNo} Lesson",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    color: Colors.grey.shade900,
                  ),
                ),

              ],
            )
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${cource.price}" , style: GoogleFonts.aBeeZee(),),
             InkWell(
               onTap: (){
                 setState(() {
                   ShoppingCartDataProvider.deleteCourse(cource);
                 });
               },
                 child: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
