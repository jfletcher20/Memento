class Article {
  final String title;
  final String text;
  final String date;
  final String imagePath;

  Article({required this.title, required this.text, required this.date, required this.imagePath});
}

extension SerializableArticle on Article {
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'text': text,
      'date': date,
      'imagePath': imagePath,
    };
  }

  static Article fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? "",
      text: map['text'] ?? "",
      date: map['date'] ?? "",
      imagePath: map['image_path'] ?? "",
    );
  }
}
