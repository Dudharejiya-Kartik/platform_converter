import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/switch_provider.dart';
import '../provider/theme_provider.dart';
import 'cupertino/cupertino.dart';
import 'material/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isActive = Provider.of<SwitchProvider>(context).isActive;
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    if (isActive) {
      return MaterialApp(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const MaterialScreen(),
      );
    } else {
      return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: themeProvider.isDarkMode
                    ? Brightness.dark
                    : Brightness.light,
              ),
              child: const Ios_Screen(),
            ),
          );
        },
      );
    }
  }
}
