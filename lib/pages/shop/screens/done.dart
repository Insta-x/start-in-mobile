// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:start_in_mobile/pages/shop/shop.dart';
import 'home_button.dart';

class DoneOrder extends StatefulWidget {
  const DoneOrder({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DoneOrder> createState() => _DoneOrderState();
}

Color themeColor = Color.fromARGB(255, 128, 208, 254);

class _DoneOrderState extends State<DoneOrder> {
  double screenWidth = 600;
  double screenHeight = 400;
  Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Text(
              "Thank You!",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Your Order Will be Delivered Soon",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: HomeButton(
                title: 'Home',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ShopPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
