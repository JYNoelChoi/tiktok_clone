import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulScreen> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks++;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$_clicks", style: TextStyle(fontSize: Sizes.size40)),
          TextButton(
            onPressed: _increase,
            child: Text("+", style: TextStyle(fontSize: Sizes.size40)),
          ),
        ],
      ),
    );
  }
}
