import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doctors/constants.dart';
import 'package:doctors/mainScreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor',
      theme: ThemeData(
        primaryColor: theme,
        splashColor: theme.withOpacity(0.25),
        highlightColor: theme.withOpacity(0.25),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        appBarTheme: const AppBarTheme(
          foregroundColor: grey,
          backgroundColor: theme,
          iconTheme: IconThemeData(
            color: white,
          ),
          titleTextStyle: TextStyle(
            color: black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
