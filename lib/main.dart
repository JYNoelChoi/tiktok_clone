import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(0xFFE9435A)),
      home: Container(
        child: Row(children: [Text("hello"), Gaps.h96, Text("hello")]),
      ),
    );
  }
}
