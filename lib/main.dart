import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktiok/controller/user_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiktiok/controller/video_controller.dart';
import 'package:tiktiok/pages/home_screen.dart';
import 'package:tiktiok/pages/login_page.dart';
import 'package:tiktiok/theme/color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put( UserController());
  Get.put( VideoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      // LoginScreen()
      FirebaseAuth.instance.currentUser == null ?const LoginScreen():const HomeScreen()
      //
    );
  }
}