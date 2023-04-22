import 'package:flutter/material.dart';
import 'package:uichallenge/widgets/Button.dart';
import 'package:uichallenge/widgets/card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black, // 앱의 백그라운드 색상
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Column 안의 내용물을 채운다.
                const SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu_open_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
                    // Column 안에 Row를 넣고, 그 Row의 내용물을 채운다.
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Row 안에 Column을 넣어 Text를 두줄로 쌓으려 한다.
                        const Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 26),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "\$5 194 382",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 17.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Button(
                        text: 'Transfer',
                        bgColor: Color(0xFFF1B33B),
                        textColor: Colors.black,
                      ),
                      Button(
                        text: 'Request',
                        bgColor: Color(0xFF1F2123),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Wallets',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const card(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 428',
                  icon: Icons.euro_outlined,
                  isInverted: false,
                  order: 0,
                ),
                const card(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin_outlined,
                  isInverted: true,
                  order: -25,
                ),
                const card(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '1 428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  order: -50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
