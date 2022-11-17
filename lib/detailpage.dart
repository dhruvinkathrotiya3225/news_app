import 'package:flutter/material.dart';
import 'package:news_app/model/news.dart';

class detailpag extends StatefulWidget {
  const detailpag({Key? key}) : super(key: key);

  @override
  State<detailpag> createState() => _detailpagState();
}

class _detailpagState extends State<detailpag> {
  @override
  Widget build(BuildContext context) {
    NewsData? res = ModalRoute.of(context)!.settings.arguments as NewsData?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail page"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${res?.imgURL}"),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "${res?.content}",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
