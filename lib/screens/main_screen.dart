import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Catalogue Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Favorites Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Cart Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  Widget? _title = RichText(
      text: TextSpan(children: [
    TextSpan(
        text: 'My',
        style:
            TextStyle(fontSize: 20, color: Color.fromARGB(255, 235, 176, 2))),
    TextSpan(
        text: 'Shop', style: TextStyle(fontSize: 20, color: Colors.white70))
  ]));
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          {
            _title = RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'My',
                  style: TextStyle(
                      fontSize: 23, color: Color.fromARGB(255, 235, 176, 2))),
              TextSpan(
                  text: 'Shop',
                  style: TextStyle(fontSize: 23, color: Colors.white70))
            ]));
          }
          break;
        case 1:
          {
            _title = const Text('Catalogue');
          }
          break;
        case 2:
          {
            _title = const Text('Favorite');
          }
          break;
        case 3:
          {
            _title = const Text('Profile');
          }
          break;
        case 4:
          {
            _title = const Text('MyCart');
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 3, 42),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        centerTitle: true,
        title: _title,
        titleTextStyle: TextStyle(fontSize: 23, color: Colors.white70),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 48, 7, 48),
        unselectedItemColor: Color.fromARGB(255, 117, 117, 117),
        iconSize: 30,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        elevation: 5,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Catalogue', icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              label: 'Favorite', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          BottomNavigationBarItem(
            label: 'MyCart',
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
    );
  }
}
