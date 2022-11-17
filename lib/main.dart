import 'dart:core';

import 'package:flutter/material.dart';
import 'package:news_app/detailpage.dart';
import 'package:news_app/helpers/News_Api_helpers.dart';
import 'package:news_app/model/news.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "detailpage": (context) => detailpag(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String catagoery = "sport";
  String APi =
      "https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: News_API_Helpers.news_api_helpers.featchAPIdata(APi: APi),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<NewsData?> data = snapshot.data;

            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("detailpage", arguments: data[i]);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 300,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage("${data[i]?.imgURL}")),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${data[i]?.title}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        catagoery = "business";
                        APi =
                            "https://newsapi.org/v2/top-headlines?country=in&category=$catagoery&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
                      });
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ),
                Text(
                  "Business",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        catagoery = "sport";
                        APi =
                            "https://newsapi.org/v2/top-headlines?country=in&category=$catagoery&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
                      });
                    },
                    icon: Icon(Icons.sports),
                  ),
                ),
                Text(
                  "sports",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        catagoery = "entertainment";
                        APi =
                            "https://newsapi.org/v2/top-headlines?country=in&category=$catagoery&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
                      });
                    },
                    icon: const Icon(Icons.music_note),
                  ),
                ),
                Text(
                  "entertainment",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        catagoery = "health";
                        APi =
                            "https://newsapi.org/v2/top-headlines?country=in&category=$catagoery&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
                      });
                    },
                    icon: Icon(Icons.health_and_safety),
                  ),
                ),
                Text(
                  "Heath",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        catagoery = "fashion";
                        APi =
                            "https://newsapi.org/v2/top-headlines?country=in&category=$catagoery&apiKey=5fae8602e88745918aa3b8fe9729e8eb";
                      });
                    },
                    icon: Icon(Icons.dangerous),
                  ),
                ),
                Text(
                  "Fashion",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
