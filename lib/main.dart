```dart
import 'package:flutter/material.dart';
import 'package:doomjober/providers/job_provider.dart';
import 'package:doomjober/providers/application_provider.dart';
import 'package:doomjober/providers/user_provider.dart';
import 'package:doomjober/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(DoomJoberApp());

class DoomJoberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
        ChangeNotifierProvider(create: (_) => ApplicationProvider()),
      ],
      child: MaterialApp(
        title: 'DoomJober',
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey[900],
          scaffoldBackgroundColor: Colors.grey[950],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey[900],
            elevation: 0,
          ),
          cardTheme: CardTheme(
            color: Colors.grey[850],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
```
