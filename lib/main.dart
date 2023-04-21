import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investmentmanager/Providers/AuthProvider.dart';
import 'package:investmentmanager/screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:investmentmanager/Providers/CardProvider.dart';
import 'package:investmentmanager/screens/auth/LoginPage.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: CardProvider(),
    ),
    ChangeNotifierProvider.value(
      value: AuthProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LoginPage(),
    );
  }
}
