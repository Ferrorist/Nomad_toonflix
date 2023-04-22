import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const settingSeconds = 2500;
  int totalSeconds = settingSeconds;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  // Timer.periodic의 매개변수에서
  // 메소드(function)가 무조건 Timer 변수를 매개변수로 가져야 하므로
  // Timer를 매개변수로 설정하였다.
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        isRunning = false;
        totalPomodoros += 1;
        totalSeconds = settingSeconds;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds -= 1;
      });
    }
  }

  // 타이머 시작 함수
  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  // 타이머 일시정지 함수
  void onPausePressed() {
    timer.cancel(); // 타이머 취소
    setState(() {
      isRunning = false;
    });
  }

  // 재시작 함수
  void onRefreshPressed() {
    if (isRunning || totalSeconds != settingSeconds) {
      setState(() {
        isRunning = false;
        totalSeconds = settingSeconds;
      });
      timer.cancel();
    }
  }

  // 초 단위 문자열 포맷 변경 함수
  String format(int seconds) {
    var durations = Duration(seconds: seconds);
    String secondString;
    if (seconds >= 3600) {
      secondString = durations.toString().split(".").first;
    } else if (seconds >= 60) {
      secondString = durations.toString().split(".").first.substring(2, 7);
    } else {
      secondString = seconds.toString();
    }
    return secondString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        // Flexible는 하드 코딩되는 값을 만들게 해준다.
        // 높이 200px, 너비 100px 이런 방식이 아닌,
        // UI를 비율에 기반해서 더 유연하게 만들 수 있게 해준다.
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                // 초 단위를 2자리까지 표기하기 위한 방법.
                // totalSeconds >= 60
                //     ? '${totalSeconds ~/ 60}:${(totalSeconds % 60).toString().padLeft(2, '0')}'
                //     : '$totalSeconds',
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 92,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline_outlined,
                    ),
                    iconSize: 90,
                    color: Theme.of(context).cardColor,
                  ),
                  if (isRunning || totalSeconds != settingSeconds)
                    IconButton(
                      onPressed: onRefreshPressed,
                      icon: const Icon(
                        Icons.refresh_outlined,
                      ),
                      iconSize: 90,
                      color: Theme.of(context).cardColor,
                    ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(35),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 50,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
