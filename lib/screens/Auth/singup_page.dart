import 'package:ecommerceapp/screens/Auth/Email_verify.dart';
import 'package:ecommerceapp/screens/Auth/LoginPage.dart';
import 'package:ecommerceapp/screens/Auth/add_phonenumber.dart';
import 'package:ecommerceapp/screens/home_page.dart';
import 'package:ecommerceapp/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'phone_verify.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 4,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 44, 3, 42),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150))),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20.0),
                  child: Text(
                    " Wellcome to our \n store!",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // child: const Text(
                      //   "Please enter Your name and email to verify your account.",
                      //   textAlign: TextAlign.start,
                      //   style: TextStyle(
                      //     color: Colors.black87,
                      //     fontSize: 16,
                      //   ),
                      // ),
                      ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                blurRadius: 15.0, // soften the shadow
                                spreadRadius: 5.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 5  horizontally
                                  5.0, // Move to bottom 5 Vertically
                                ),
                              )
                            ]),
                            padding: const EdgeInsets.all(10),
                            width: size.width - 100,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Full Name',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 61, 5, 44)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 61, 5, 44)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 2,
                                              color: Color.fromARGB(
                                                  255, 61, 5, 44)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: size.width - 100,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(10),
                                        backgroundColor: Color.fromARGB(
                                            255,
                                            207,
                                            156,
                                            2), // background (button) color
                                        foregroundColor: Colors
                                            .white, // foreground (text) color
                                      ),
                                      onPressed: () {
                                        formKey.currentState?.validate();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EmailVerify()));
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Text(
                                          'SignUp',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  }),
                                  child: Container(
                                    width: size.width - 100,
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        'I have already an account? Login',
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 71, 3, 60),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
