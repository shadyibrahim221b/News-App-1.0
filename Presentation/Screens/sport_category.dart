import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/News%20App/Presentation/Screens/Data/articlemodel.dart';
import 'package:flutter_application_1/News%20App/Presentation/Widgets/newsapp_webview.dart';
import 'package:flutter_application_1/News%20App/Presentation/Widgets/newsview.dart';
import 'package:http/http.dart' as http;
class Sport extends StatefulWidget{
  const Sport({super.key});

  @override
  State<Sport> createState() => _SportState();
}

class _SportState extends State<Sport> {
  List<ArticleModle> modelList= <ArticleModle>[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSportNews(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
        return  Scaffold(
        appBar: AppBar(title: Text('Egypt News'),
        centerTitle: true,
        ),
        body: Center(child: ListView.builder(
          itemCount: modelList.length,
          itemBuilder:(context, index) {
          return InkWell(
              onTap: () {
                      Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext  context) =>  WebViewApp(url: modelList[index].url!)
                )
                );
            },
            child: Card(
              elevation: 10,
              shape:  RoundedRectangleBorder(
              side:BorderSide(
                color: Colors.white54,
                width: 5
              ),
              ),
              child:NewsView(title: modelList[index].title!,author: modelList[index].author!,url: modelList[index].url!,)
            ),
          );
        },
        )
        ),
      );
      }
      else{
      return  Center(child: CircularProgressIndicator(),);
      }
    }, 
    );
  }
  getSportNews() async{
      print('length of model list ${modelList.length}');
      http.Response resp = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=e58739624dae4cb5b62c960eb8e8b4ed'));
      var respBody = jsonDecode(resp.body);
      var articlesList = respBody['articles'];
      for (var element in articlesList) {
        ArticleModle articleModle =ArticleModle.fromJson(element);
        modelList.add(articleModle);
      }
      //NewsView(modelList: modelList);
      return  'length of model list ${modelList.length}';
  }
}