import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:foodorderinganddelivery/screens/Auth/verify_page.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                    " What Is Your Phone \n Number?",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30,
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
                    child: const Text(
                      "Please enter Your Phone number to verify \n your account.",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        const SizedBox(
                          height: 25,
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
                                        builder: (context) => VerifyPage()));
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Send Verification Code',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        )
                      ],
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

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
