import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';
import '../models/webtoon_model.dart';

class Webtoon extends StatelessWidget {
  final WebtoonModel webtoon;

  // User-Agent를 사용하지 않으면, 네이버에서 차단함.
  // 봇인지 판별하기 위함.
  final networkHeader = {
    "User-Agent":
        "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
  };

  Webtoon({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    // 대부분의 동작을 감지함.
    return GestureDetector(
      onTap: () {
        // 현재 build의 context를 의미.
        // route는 StatelessWidget을 애니메이션 효과로 감싸서
        // 스크린처럼 보이도록 하겠다는 것이다.
        Navigator.push(
          context,
          // MaterialPageRoute(
          //   builder: (context) => DetailScreen(
          //     webtoon: webtoon,
          //   ),
          //   fullscreenDialog: true,
          // ),
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailScreen(webtoon: webtoon),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              }),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 9,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ]),
            child: Image.network(
              webtoon.thumb,
              headers: networkHeader,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
