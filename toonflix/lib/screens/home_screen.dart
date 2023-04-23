import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      // FutureBuilder가 알아서 future 데이터를 await 한다.
      // snapshot을 이용하면 Future의 상태를 알 수 있다.
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    // 유저의 화면에 보이지 않는
    // 혹은 스크롤(scroll) 등으로 인해 보이지 않게 될 경우,
    // 해당 아이템을 메모리에서 제거함.
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // index로만 접근 가능
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonWidget(webtoon: webtoon);
      },
      // 아이템들 사이에 구분자를 넣어주는 builder
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
