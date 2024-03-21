import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/authentication/Auth.dart';
import 'package:trash_to_cash_flutter/features/authentication/screens/onboarding/onboarding.dart';

import 'features/authentication/screens/login/login.dart';
import 'utils/themes/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Trash To Cash',
      themeMode: ThemeMode.system,
      theme: TTCThemes.lightTheme,
      darkTheme: TTCThemes.darkTheme,
      home: const Authentication(),
      
    );
  }
}