import 'package:flutter/material.dart';
import 'package:social_adventure_ui/presentation/screens/home_screen.dart';

import 'core/themes.dart';

class SocialAdventureAppUi extends StatelessWidget {
  const SocialAdventureAppUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Adventure App UI',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
