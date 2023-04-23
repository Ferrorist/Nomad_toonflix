import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';

class EpisodeWidget extends StatelessWidget {
  final WebtoonEpisodeModel episode;
  final String webtoon_id;

  const EpisodeWidget({
    super.key,
    required this.episode,
    required this.webtoon_id,
  });

  onButtonTap() async {
    late final String webtoonUrl;
    // 1화인 경우 episode.id가 없음.
    // if (episode.id != "") {
    //   webtoonUrl =
    //       "https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=${(int.parse(episode.id) + 1).toString()}";
    // } else {
    //   webtoonUrl =
    //       "https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=1";
    // }
    webtoonUrl =
        "https://comic.naver.com/webtoon/detail?titleId=$webtoon_id&no=${episode.id}";
    final url = Uri.parse(webtoonUrl);
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightGreen.shade400,
            width: 2.4,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(6, 8),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(
                  color: Colors.lightGreen.shade400,
                  fontSize: 15,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.lightGreen.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
