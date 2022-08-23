import 'package:flutter/material.dart';
import 'package:tiktiok/theme/color.dart';
import 'package:marquee/marquee.dart';
class LeftPanel extends StatelessWidget {
  final String name;
  final String caption;
  final String songName;
  final Size size;
  const LeftPanel({
    Key? key,
    required this.size,
   required this.name,
  required  this.caption,
  required  this.songName,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.8,
      height: size.height,
      margin: EdgeInsets.only(bottom: size.height*0.02,left: size.width*0.02),
      decoration:const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style:const TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const   SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style:const TextStyle(color: white),
          ),
          const  SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              const  Icon(
                Icons.music_note,
                color: white,
                size: 15,
              ),
              Container(
                height: size.height*0.02,
                width: size.width*0.4,
                // color: Colors.red,
                child: Marquee(

                  text: songName,
                  style:const TextStyle(color: white, height: 1.5),
                  scrollAxis: Axis.horizontal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}