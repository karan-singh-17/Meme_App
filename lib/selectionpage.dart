import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:memeapp/selects_model.dart';
import 'package:memeapp/test.dart';
import 'package:slide_to_act/slide_to_act.dart';

class selectionpage extends StatelessWidget {
  const selectionpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtcontrols = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text("MEME APP" , style: TextStyle(fontWeight: FontWeight.bold ,
        color: Colors.tealAccent
        ,letterSpacing: 3.0,
        fontSize: 30),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white24,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: txtcontrols,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 40,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => test(mass: txtcontrols.text,)));
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20 , bottom: 10),
              child: Text(
                ": POPULAR  CATEGORIES :" , style: TextStyle(color: Colors.redAccent ,fontSize: 20 , fontWeight: FontWeight.bold , letterSpacing: 4.0),
              ),
            ),
            selects_model(urls: 'Dank Memes'),
            selects_model(urls: 'ADVICE ANIMALS'),
            selects_model(urls: 'Meme Economy'),
            selects_model(urls: 'Animemes'),
            selects_model(urls: 'Gym Memes'),
            selects_model(urls: 'Comedy Cemetery'),
            selects_model(urls: 'Relationship Memes'),
          ],
        ),
      ),
    );
  }
}
