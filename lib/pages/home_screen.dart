import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktiok/pages/profile_screen.dart';
import 'package:tiktiok/theme/color.dart';
import 'package:tiktiok/widgets/footer_home_screen.dart';
import 'package:tiktiok/widgets/tik_tok_icons.dart';
import 'package:tiktiok/widgets/upload_icon.dart';

import '../widgets/header_home_screen.dart';
import 'following_screen.dart';
import 'for_you_screen.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(initialPage: 1);
  int pageIndex = 0;
  bool hasData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      // StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context,snapShot){
      //       if(snapShot.connectionState == ConnectionState.waiting){
      //         return const Center(child: CircularProgressIndicator());
      //       }
      //       else if(snapShot.hasError){
      //         Get.snackbar('Something went wrong', 'Please try again',
      //             colorText: Colors.red,backgroundColor: ofWhiteColor,snackPosition: SnackPosition.BOTTOM
      //         );
      //       }
      //       else if(snapShot.hasData){
      //         getBody();
      //         setState(() {
      //           hasData  = true;
      //         });
      //       }
      //       return const LoginScreen();
      //     }),
      bottomNavigationBar:
          pageIndex == 2 ? null : getFooter(context, pageIndex: 0)
    );
  }
  Widget getBody(){
    return PageView(
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        controller: controller,
        children:  [
          FollowingScreen(pageIndex: pageIndex,),
          MainScreenContent(pageIndex: pageIndex),
          const ProfileScreen(),
        ]);
  }
}
