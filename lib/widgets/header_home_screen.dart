import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../pages/search_screen.dart';
import '../theme/color.dart';

Widget headerHomePage(BuildContext context,{required Size size}) {
  return Container(
    // color:Colors.red,
    // margin: EdgeInsets.only(top: size.height*0.05),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: size.width*0.2,
          // bottom: size.height*0.05
          ),
          child: Image.asset('assets/images/live_icon.png'
          ,height: 30,color: white,width: 30,),
        ),
        Text(
          'Following',
          style: TextStyle(fontSize: 20, color: white.withOpacity(0.5)),
        ),
        SizedBox(width: size.width * 0.02),
        Text(
          '|',
          style: TextStyle(fontSize: 20, color: white.withOpacity(0.5)),
        ),
        SizedBox(width: size.width * 0.02),
        const Text(
          'For You',
          style: TextStyle(color: white, fontSize: 20),
        ),
        GestureDetector(
          onTap: (){
            debugPrint('clicked!111');
            showSearch(context: context, delegate:  SearchScreen());

          },
          child: Container(
              margin: EdgeInsets.only(left: size.width*0.2),
              child: SvgPicture.asset('assets/images/search_icon.svg',color: white,)),
        )

      ],
    ),
  );
}