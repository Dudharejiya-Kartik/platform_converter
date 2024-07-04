import 'package:flutter/material.dart';
import 'package:platform_converter/provider/chat_provider.dart';
import 'package:platform_converter/provider/date_provider.dart';
import 'package:platform_converter/provider/profile_switch.dart';
import 'package:platform_converter/provider/switch_provider.dart';
import 'package:platform_converter/provider/theme_provider.dart';
import 'package:platform_converter/views/homepage.dart';
import 'package:provider/provider.dart';

import 'compnents/imagepicker.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SwitchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PersonAddProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
      ],
      child: const HomePage(),
    ),
  );
}
