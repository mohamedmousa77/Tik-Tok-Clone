import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiktiok/controller/video_controller.dart';
import 'package:tiktiok/widgets/upload_icon.dart';

import '../pages/home_screen.dart';
import '../pages/profile_user_screen.dart';
import '../pages/upload_video_camera_screen.dart';
import '../theme/color.dart';


Widget getFooter(BuildContext context, {required int pageIndex}) {
  List bottomItem = [
    {
      'icon': Icons.home,
      'label': 'Home',
      'isIcon': true,
    },
    {
      'icon': 'assets/images/friend_icon.svg',
      'label': 'Friends',
      'isIcon': true,
    },
    {
      'icon': '',
      'label': '',
      'isIcon': false,
    },
    {
      'icon': 'assets/images/inbox_icon.png',
      'label': 'Inbox',
      'isIcon': true,
    },
    {
      'icon':'assets/images/person_icon.png',
      'label': 'Profile',
      'isIcon': true,
    }
  ];
  return Container(
    height: MediaQuery.of(context).size.height * 0.07,
    // height: 80,
    width: MediaQuery.of(context).size.width,
    color: pageIndex == 1 ? white:appBgColor,
    child: Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // home
          InkWell(
            onTap: (){
              pageIndex == 0 ? null : Get.to(const HomeScreen());
              Get.find<VideoController>().selectPage(0);
              // selectedIndex (index);
            },
            child: Column(
              children: [
                Icon(
                  bottomItem[0]['icon'],
                  color:pageIndex == 1?Colors.grey: white,
                  // size: 20,
                ),
                const SizedBox(height: 5),
                Text(
                  bottomItem[0]['label'],
                  style:  TextStyle(
                    color:pageIndex == 1?Colors.grey: white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          //Friends
          InkWell(
            onTap: (){
              // Get.find<VideoController>().selectPage(1);
            },
            child: Column(
              children: [
                SvgPicture.asset(
                  bottomItem[1]['icon'],
                  color:pageIndex == 1?Colors.grey: white,
                  height: 25,
                  width: 25,
                ),
                const SizedBox(height: 5),
                Text(
                  bottomItem[1]['label'],
                  style:  TextStyle(
                    color:pageIndex == 1?Colors.grey: white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          //upload
          InkWell(
              onTap: (){
                Get.to(const CameraPage());
                Get.find<VideoController>().selectPage(2);
              },
              child: const UploadIcon()),
          //inbox
          InkWell(
            onTap: (){
              // Get.find<VideoController>().selectPage(3);
            },
            child: Column(
              children: [
                Image.asset( bottomItem[3]['icon'],
                  height: 25,
                  width: 25,
                  color:pageIndex == 1?Colors.grey: Colors.white,),
                const SizedBox(height: 5),
                Text(
                  bottomItem[3]['label'],
                  style:  TextStyle(
                    color:pageIndex == 1?Colors.grey: white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          //profile
          InkWell(
            onTap: (){
              pageIndex == 1 ? null : Get.to(const  ProfileUserScreen());
              Get.find<VideoController>().selectPage(4);
            },
            child: Column(
              children: [
                pageIndex == 1
                    ?const  Icon(Icons.person,color: Colors.black,size: 30,)
                : Image.asset( bottomItem[4]['icon'],
                  height: 25,
                  width: 25,),

                // const SizedBox(height: 5),
                Text(
                  bottomItem[4]['label'],
                  style:  TextStyle(
                    color:pageIndex == 1?Colors.black: white,
                    fontSize: 10,
                    fontWeight: pageIndex == 1?FontWeight.w700:FontWeight.w500
                  ),
                )
              ],
            ),
          )
        ],

        // children: List.generate(bottomItem.length, (index) {
        //   return bottomItem[index]['isIcon']
        //       ? InkWell(
        //     onTap: (){
        //       // selectedIndex (index);
        //     },
        //     child: Column(
        //       children: [
        //         Icon(
        //           bottomItem[index]['icon'],
        //           color: white,
        //           // size: 20,
        //         ),
        //         const SizedBox(height: 5),
        //         Text(
        //           bottomItem[index]['label'],
        //           style: const TextStyle(
        //             color: white,
        //             fontSize: 10,
        //           ),
        //         )
        //       ],
        //     ),
        //   )
        //       : InkWell(
        //       onTap: (){
        //         // selectedIndex(index);
        //       },
        //       child:  UploadIcon());
        // }),
      ),
    ),
  );
}