import 'package:flutter/material.dart';

class NewsView extends StatefulWidget{
  String author;
  String title;
  String url;
   NewsView({super.key,required this.author,required this.title,required this.url});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return 
        Row(
          children: [
            SizedBox(width: 8,),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(),
                child: FittedBox(
                  child: Image.network('https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM='),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 20,),
            Container(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: Center(
                    child: Title(color:Colors.blue, child: Text(widget.author!,style:TextStyle(color: Colors.blue),maxLines: 100,
                    )
                    ),
                  )
                  ),
                SizedBox(height: 8,),
                SizedBox(
                  width: 160,
                  child: Text(widget.title!,maxLines: 200,style: TextStyle(fontWeight: FontWeight.w500),))
            ],),)
          ],
        );
  }
}