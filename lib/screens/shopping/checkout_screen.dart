import 'package:csc_picker/csc_picker.dart';
import 'package:e_learning/constants.dart';
import 'package:e_learning/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learning/screens/shopping/widget/payment_methods.dart';
import 'package:e_learning/util/routes_name.dart';
import 'package:e_learning/util/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data_provider/my_course_data_provider.dart';
import '../../model/course.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen(
      {super.key, required this.courseList, required this.totalPrice});

  final List<Course> courseList;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Checkout',
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Build Adderss',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CSCPicker(
                  layout: Layout.vertical,
                  flagState: CountryFlag.DISABLE,
                  onCountryChanged: (value) {},
                  onStateChanged: (value) {},
                  onCityChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Payment Methods',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const PaymentMathods(),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Order',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: courseList.length,
                    itemBuilder: (context, index) {
                      Course course = courseList[index];
                      return ListTile(
                        leading: Image.asset(
                          course.thumbnailUrl,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          course.title,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "\$${course.price}",
                          style: GoogleFonts.aBeeZee(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$totalPrice",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                  ElevatedButton(

                    onPressed: () {
                      MyCourseDataProvider.addAllCourses(courseList);
                      ShoppingCartDataProvider.clearCart();
                      Util.showMessage(context, "Your Order is placed successfully");
                      Navigator.pushNamed(context, RoutesName.courceHome);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                    ),
                    child: Text(
                      'Place Order',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
