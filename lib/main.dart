import 'package:flutter/material.dart';
import 'package:flutterqualif/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'model/darkStyle.dart';
import 'model/themeProvider.dart';

void main(List<String> args) {
  runApp(const CLApps());
}

class CLApps extends StatefulWidget {
  const CLApps({super.key});

  @override
  State<CLApps> createState() => _CLAppsState();
}

class _CLAppsState extends State<CLApps> {
  late Brightness _currBrightness;
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  void updateTheme(Brightness newBrightness) {
    setState(() {
      _currBrightness = newBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: const LoginPage(),
            );
          },
        ),);
  }
}