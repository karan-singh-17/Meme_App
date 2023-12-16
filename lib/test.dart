import 'dart:convert';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class test extends StatefulWidget {
  String mass;
  test({required this.mass});
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  List<String> previewImages = [];

  @override
  void initState() {
    super.initState();
    // Fetch and populate the initial list of URLs (You can replace this with your actual API call)

  }

  Future getMeme(String s) async {
    setState(() {
      previewImages.clear();
    });
    previewImages.clear();
    var response = await http.get(Uri.https('meme-api.com', s));
    var jsonData = json.decode(response.body);
    print(jsonData);
    Map<String, dynamic> jsonResponse = jsonData;
    for (var meme in jsonResponse['memes']) {
      String url = meme['url'];
      previewImages.add(url);
    }
    print(previewImages);
  }

  @override
  Widget build(BuildContext context) {
    String titlebar = widget.mass.toString();
    if(titlebar == 'makens123'){
      titlebar = 'Mia Khalifa';
    }
    String cats = titlebar.toLowerCase().replaceAll(" ", "").toString();
    String s = 'gimme/' + cats + '/15';
    previewImages.clear();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          titlebar.toUpperCase(),
          style: TextStyle(color: Colors.green , wordSpacing: 4 , fontWeight: FontWeight.bold),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        centerTitle: true,
      ),
      body: memedisplay(s),
    );
  }

  FutureBuilder<dynamic> memedisplay(String k) {
    return FutureBuilder(
      future: getMeme(k),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LiquidPullToRefresh(
            onRefresh: () async{
              Future.delayed(Duration(seconds: 4));
              getMeme(k);
            },
            animSpeedFactor: 2,
            height: 125,
            backgroundColor: Colors.green,
            color: Colors.white10,
            child: ListView.builder(
              itemCount: previewImages.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: Colors.green,
                                style: BorderStyle.solid,
                                width: 1,
                              ),
                              color: Colors.black,

                              image: DecorationImage(
                                image: NetworkImage(previewImages[index]),
                                fit: BoxFit.scaleDown,
                              )),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
              strokeWidth: 4.0,
            ),
          );
        }
      },
    );
  }
}
