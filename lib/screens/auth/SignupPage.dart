import 'package:flutter/material.dart';
import 'package:investmentmanager/Providers/AuthProvider.dart';
import 'package:investmentmanager/screens/HomePage.dart';
import 'package:investmentmanager/screens/auth/LoginPage.dart';
import 'package:investmentmanager/utils/ColorConstants.dart';
import 'package:investmentmanager/widgets/CustomButton.dart';
import 'package:investmentmanager/widgets/CustomInput.dart';
import 'package:investmentmanager/widgets/CustomSimpleDialog.dart';
import 'package:investmentmanager/widgets/CustomText.dart';
import 'package:investmentmanager/widgets/CustomeSizedbox.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return CustomSizedbox(
      image: DecorationImage(
          fit: BoxFit.cover, image: AssetImage('assets/images/auth_bg.jpg')),
      padding: 0,
      radius: 0,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Center(
            child: CustomSizedbox(
              padding: 10,
              radius: 15,
              color: ColorConstants().whiteTextColor,
              width: double.infinity,
              height: 550,
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'SignUp',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: ColorConstants().primary,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 'First Name',
                    controller: firstnameController,
                    obscureText: false,
                    readOnly: false,
                    prefixIcon: Icons.person,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 'Last Name',
                    controller: lastnameController,
                    obscureText: false,
                    readOnly: false,
                    prefixIcon: Icons.person,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 'Email Address',
                    controller: emailController,
                    obscureText: false,
                    readOnly: false,
                    prefixIcon: Icons.email,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 'Phone Number',
                    controller: phoneController,
                    obscureText: false,
                    readOnly: false,
                    prefixIcon: Icons.phone,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    readOnly: false,
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomInput(
                    hintText: 're-Password',
                    controller: repasswordController,
                    obscureText: true,
                    readOnly: false,
                    prefixIcon: Icons.lock,
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),

                  CustomButton(
                    onPressed: (() async {
                      await authProvider.registerUser(
                          firstnameController.text,
                          lastnameController.text,
                          phoneController.text,
                          emailController.text,
                          passwordController.text);
                      if (authProvider.status == signStatus.authenticated) {
                        CustomDialog.showSimpleDialog(
                            context, 'Registered', []);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(),
                                maintainState: true),
                            (Route<dynamic> route) => false);
                      } else if (authProvider.status ==
                          signStatus.unauthenticated) {
                        CustomDialog.showSimpleDialog(
                            context, authProvider.statusMessage.toString(), []);
                      }
                    }),
                    child:
                        authProvider.status == signStatus.signupauthenticating
                            ? Container(
                                width: 28,
                                height: 28,
                                child: CircularProgressIndicator(
                                  color: ColorConstants().whiteTextColor,
                                ),
                              )
                            : Text('Signup',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConstants().whiteTextColor)),
                  ),

                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
                    child: CustomText(
                      decoration: TextDecoration.underline,
                      text: 'Already have an account?',

                      // fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: ColorConstants().primary,
                    ),
                  ),
                  // TextDecoration.underline
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
