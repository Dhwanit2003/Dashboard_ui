import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:dashboard_ui/controllers/controllers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => Controller(),)
    ],
    child: HomeScreen(),
      ),
    );
  }
}
