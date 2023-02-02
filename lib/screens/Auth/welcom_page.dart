import 'dart:ui';

import 'package:ecommerceapp/screens/Auth/LoginPage.dart';
import 'package:ecommerceapp/screens/Auth/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'add_phonenumber.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 160, 148, 160),
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/bg.png'))),
      width: size.width,
      height: size.height,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 114, 87, 114).withOpacity(0.5),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.transparent,
              height: size.height / 2,
            )),
            Expanded(
                child: Container(
              height: size.height / 2,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      width: size.width / 2 + 50,
                      decoration: BoxDecoration(
                          color: Colors.yellow.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                          )),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      width: size.width,
                      height: size.height / 2 - 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 155, 124, 155),
                              Color.fromARGB(255, 73, 28, 69),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'My',
                                style: TextStyle(
                                    letterSpacing: 1.75,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                    color: Color.fromARGB(255, 238, 179,
                                        77))), //                                    backgroundColor: Color.fromARGB(255, 238, 179,
                            TextSpan(
                                text: 'Shop',
                                style: TextStyle(
                                  letterSpacing: 1.75,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                  color: Colors.white70,
                                )) //                                    backgroundColor: Color.fromARGB(255, 238, 179,
                          ])),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: size.width / 1.4,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Color.fromARGB(255, 207, 156,
                                      2), // background (button) color
                                  foregroundColor:
                                      Colors.white, // foreground (text) color
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        )),
      ),
    );
  }
}
