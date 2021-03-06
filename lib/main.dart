import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'empus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText2: GoogleFonts.montserrat(textStyle: textTheme.headline4),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
