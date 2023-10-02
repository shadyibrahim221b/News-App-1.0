class ArticleModle{
  String? title;
  String? author;
  String? url;

  ArticleModle.fromJson(Map<String,dynamic> articleMap){
    author=articleMap['author'];
    title=articleMap['title'];
    url=articleMap['url'];
  }

}
