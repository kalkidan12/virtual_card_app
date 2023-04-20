import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investmentmanager/Components/CardList.dart';
import 'package:investmentmanager/Components/TransactionView.dart';
import 'package:investmentmanager/Model/TransactionModel.dart';
import 'package:investmentmanager/Pages/AddCardPage.dart';
import 'package:investmentmanager/Providers/CardProvider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
      value: CardProvider(),
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 241, 242, 1),
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "Home page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromRGBO(238, 241, 242, 1),
        elevation: 0,
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black45,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddCardPage()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              (Provider.of<CardProvider>(context).getCardLength() > 0
                  ? Container(
                      height: 210,
                      child: Consumer<CardProvider>(
                        builder: (context, cards, child) => CardList(
                          cards: cards.allCards,
                        ),
                      ))
                  : Container(
                      height: 210,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Add your new card click the \n + \n button in the top right.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Last Transactions",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black45),
              ),
              SizedBox(
                height: 15,
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Shopping', price: 1000, type: '-', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Salary', price: 1000, type: '+', currency: 'US'),
              ),
              TransactionView(
                transaction: TransactionModel(
                    name: 'Receive', price: 200, type: '+', currency: 'US'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
