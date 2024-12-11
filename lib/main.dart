import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubenfy/intro/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rubenfy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        fontFamily: GoogleFonts.pixelifySans().fontFamily,
        useMaterial3: true,
      ),
      home: const Intro(),
    );
  }
}