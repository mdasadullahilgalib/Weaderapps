import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class page1 extends StatefulWidget {
  const page1({Key? key}) : super(key: key);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {

  final List<String> imageList =[
    "assets/one.jpg",
    "assets/two.jpg",
    "assets/three.jpg",
    "assets/four.jpg",
    "assets/five.jpg",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: GFAppBar(
        title: Text("UI with GetWidget"),
        centerTitle: true,
      ),
      body: Column(

        children: [

          GFCarousel(

              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 1) ,
              scrollDirection: Axis.horizontal,
              items: imageList.map((item) => Card(

            elevation: 10,

            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(item),
                fit: BoxFit.cover
                ),

              ),
            ),

          )).toList()
          )
        ],
      ),

    );
  }
}
