import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mediaplayer/components/colors.dart';
import 'package:mediaplayer/components/exporting_packages.dart';
import 'package:mediaplayer/screens/home/home_page.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: ConstColor.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Media Player',
      theme: ThemeData.dark(),
      darkTheme: ThemeData(
        backgroundColor: ConstColor.black,
        scaffoldBackgroundColor: ConstColor.black,

      ),
      home: HomePage(),
    );
  }
}
