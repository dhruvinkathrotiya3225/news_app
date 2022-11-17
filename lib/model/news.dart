class NewsData {
  final String imgURL;
  final String title;
  final String content;

  NewsData({
    required this.imgURL,
    required this.title,
    required this.content,
  });
  factory NewsData.fromMap({required Map<String, dynamic> data}) {
    return NewsData(
      title: data["title"] ?? "UNKNOWN",
      imgURL: data["urlToImage"] ?? "UNKNOWN",
      content: data["content"] ?? "UNKNOWN",
    );
  }
}
