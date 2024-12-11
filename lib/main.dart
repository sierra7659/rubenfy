import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rubenfy/intro/intro.dart';
import 'package:rubenfy/ratings/provider/rating_provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RatingProvider()),
        ],
        child: const MyApp()
      )
  );
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
        colorScheme: ColorScheme.dark(primary: Colors.white),
        fontFamily: GoogleFonts.vt323().fontFamily,
        useMaterial3: true,
      ),
      home: const Intro(),
    );
  }
}