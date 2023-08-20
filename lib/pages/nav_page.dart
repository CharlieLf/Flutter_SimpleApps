import 'package:flutter/material.dart';
import 'package:flutterqualif/func/navigate_func.dart';
import 'package:flutterqualif/pages/home_page.dart';
import 'package:flutterqualif/pages/item_page.dart';
import 'package:flutterqualif/pages/login_page.dart';
import 'package:provider/provider.dart';

import '../model/themeProvider.dart';


class NavigationPage extends StatefulWidget {
  final String username;
  const NavigationPage({super.key, required this.username});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _indexPage = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _pages = [];
  final List<Widget> _toggleWidget = [
    const Icon(Icons.sunny),
    const Icon(Icons.nightlight_outlined)
  ];
  List<bool> _selectedTheme = [true, false];


  @override
  Widget build(BuildContext context) {

    _pages = [const HomePage(), ItemPage(username: widget.username)];
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Hi, ${widget.username}'),
            const SizedBox(
                width: 10), // Add spacing between username and toggle button

            ToggleButtons(
              isSelected: _selectedTheme,
              children: _toggleWidget,
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < _selectedTheme.length; i++) {
                    _selectedTheme[i] = (i == index);
                  }
                  themeChange.darkTheme = _selectedTheme[1];
                });
              },
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              navigateWithoutBackButton(
                  context, "Your Logging Out", const LoginPage());
            },
          ),
        ],
      ),
      body: _pages[_indexPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _indexPage = value;
          });
        },
        currentIndex: _indexPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            tooltip: "Home",
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_outlined),
            tooltip: "Item",
            label: "Item",
            activeIcon: Icon(Icons.card_giftcard),
          ),
        ],
      ),
    );
  }
}
