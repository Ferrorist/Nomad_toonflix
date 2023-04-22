import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  // widget의 key를 StatelessWidget이라는 슈퍼클래스에 보냄.
  // widget의 key는 ID와 같은 식별자 역할을 함.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: const HomeScreen(),
      ),
    );
  }
}
