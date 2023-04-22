class WebtoonModel {
  final String title, thumb, id;

  // 네임드 생성자(Named Constructor)
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
