import 'package:ecommerceapp/screens/Auth/add_phonenumber.dart';
import 'package:ecommerceapp/screens/Auth/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../main_screen.dart';

class PhoneVerify extends StatefulWidget {
  const PhoneVerify({super.key});

  @override
  State<PhoneVerify> createState() => _PhoneVerifyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

final TextEditingController controller = TextEditingController();

class _PhoneVerifyState extends State<PhoneVerify> {
  bool _onEditing = true;
  String? _code;
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    " Almost \n done!",
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Text(
                      "Please enter code sent to ",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text('+251234567889',
                              style: TextStyle(
                                  color: Color.fromARGB(179, 34, 27, 27),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddphonNumber()));
                          },
                          child: const Text('Change phone number?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(179, 37, 28, 28),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 25,
                          ),
                          VerificationCode(
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                            keyboardType: TextInputType.number,
                            underlineColor: Color.fromARGB(255, 38, 109,
                                73), // If this is null it will use primaryColor: Colors.red from Theme
                            length: 4,
                            cursorColor: Color.fromARGB(255, 46, 8,
                                38), // If this is null it will default to the ambient
                            // clearAll is NOT required, you can delete it
                            // takes any widget, so you can implement your design
                            clearAll: Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                            margin: const EdgeInsets.all(12),
                            onCompleted: (String value) {
                              setState(() {
                                _code = value;
                              });
                            },
                            onEditing: (bool value) {
                              setState(() {
                                _onEditing = value;
                              });
                              if (!_onEditing) FocusScope.of(context).unfocus();
                            },
                          ),
                          Container(
                            width: size.width - 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(10),
                                  backgroundColor: Color.fromARGB(255, 207, 156,
                                      2), // background (button) color
                                  foregroundColor:
                                      Colors.white, // foreground (text) color
                                ),
                                onPressed: () {
                                  formKey.currentState?.validate();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainScreen()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
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
