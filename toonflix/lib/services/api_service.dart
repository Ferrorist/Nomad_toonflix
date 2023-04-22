import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // await을 사용할 것이므로 비동기 함수로 만들기 위해
  // async를 사용함. 또한 값을 return 하려면 Future 키워드를 사용해야 함.
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    // get의 return 타입은 Future<Response> 이다.
    // Future는 미래에 받을 값의 타입을 알려준다.
    // 그리고 그 타입이 Response라는 것이다.
    // get 메소드의 처리를 기다려야 하므로
    // await 키워드를 사용해야 한다.

    if (response.statusCode == 200) {
      // print(response.body);
      // json 파일이 return됨.
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
