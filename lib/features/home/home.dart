import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/home/screens/buy/buy_page.dart';
import 'package:trash_to_cash_flutter/features/home/screens/chats/chats_page.dart';
import 'package:trash_to_cash_flutter/features/home/screens/sell/sell_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Map<int, GlobalKey> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: PopScope(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              BuyPage(navigatorKey: navigatorKeys[0]!),
              SellPage(navigatorKey: navigatorKeys[1]!),
              ChatsPage(navigatorKey: navigatorKeys[2]!),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    ));
  }
}
