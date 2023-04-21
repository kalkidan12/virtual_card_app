import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:investmentmanager/Providers/AuthProvider.dart';
import 'package:investmentmanager/screens/HomePage.dart';
import 'package:investmentmanager/screens/auth/SignupPage.dart';
import 'package:investmentmanager/utils/ColorConstants.dart';
import 'package:investmentmanager/widgets/CustomAppbar.dart';
import 'package:investmentmanager/widgets/CustomButton.dart';
import 'package:investmentmanager/widgets/CustomInput.dart';
import 'package:investmentmanager/widgets/CustomSimpleDialog.dart';
import 'package:investmentmanager/widgets/CustomText.dart';
import 'package:investmentmanager/widgets/CustomeSizedbox.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
              height: 320,
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Login',
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
                    hintText: 'Email',
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

                  CustomText(
                    text: 'Forgot Password?',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: ColorConstants().primary.withOpacity(.9),
                  ),
                  CustomSizedbox(
                    padding: 0,
                    radius: 0,
                    height: 15,
                  ),
                  CustomButton(
                    onPressed: (() async {
                      await authProvider.signIn(
                          emailController.text, passwordController.text);
                      if (authProvider.status == signStatus.authenticated) {
                        // CustomDialog.showSimpleDialog(
                        //     context, 'Registered', []);
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
                    child: authProvider.status == signStatus.loginauthenticating
                        ? Container(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              color: ColorConstants().whiteTextColor,
                            ),
                          )
                        : Text('Login',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    }),
                    child: CustomText(
                      decoration: TextDecoration.underline,
                      text: 'Create new account?',

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
