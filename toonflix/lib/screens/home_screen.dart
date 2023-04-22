import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 1, // 음영
      ),
    );
  }
}
