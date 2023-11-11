import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMathods extends StatefulWidget {
  const PaymentMathods({super.key});

  @override
  State<PaymentMathods> createState() => _PaymentMathodsState();
}

class _PaymentMathodsState extends State<PaymentMathods> {
  Methods _paymentMethod = Methods.netbanking;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<Methods>(
          value: Methods.netbanking,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: Text('Net Banking' , style: GoogleFonts.aBeeZee(),),
        ),
        RadioListTile<Methods>(
          value: Methods.cards,
          groupValue: _paymentMethod,
          onChanged: (Methods? value) {
            setState(() {
              _paymentMethod = value!;
            });
          },
          title: Text('Credit/Depit Card' , style: GoogleFonts.aBeeZee(),),
        ),
      ],
    );
  }
}

enum Methods { netbanking, cards }
