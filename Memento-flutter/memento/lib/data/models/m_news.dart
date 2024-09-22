import 'package:memento/data/models/m_article.dart';

class News {
  final int count;
  final List<Article> results;

  News({required this.count, required this.results});
}

extension SerializableNews on News {
  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'results': results.map((article) => article.toMap()).toList(),
    };
  }

  static News fromMap(Map<String, dynamic> map) {
    return News(
      count: map['count'],
      results: List<Article>.from(map['results'].map(
        (article) => SerializableArticle.fromMap(article),
      )),
    );
  }
}
