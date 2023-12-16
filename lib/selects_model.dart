import 'package:flutter/material.dart';
import 'package:memeapp/test.dart';
import 'package:slide_to_act/slide_to_act.dart';

class selects_model extends StatelessWidget {
  final String urls;

  const selects_model({required this.urls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SlideAction(
              height: 60,
              borderRadius: 10.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Text(urls, style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                overflow: TextOverflow.fade,
                maxLines: 1,),
              ),
              innerColor: Colors.black,
              sliderButtonIconSize: 20.0,
              outerColor: Colors.grey,

              onSubmit: () {
                String ans = urls;
                Navigator.push(context, MaterialPageRoute(builder: (context) => test(mass: ans,)));
              },
                    ),
          ),
      ),
    );
}
}
