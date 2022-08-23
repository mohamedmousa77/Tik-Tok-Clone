import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktiok/pages/home_screen.dart';

class UserController extends GetxController {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userInfo;
  GoogleSignInAccount get userInfo => _userInfo!;

  Future faceBookLogin()async{
    try{
      final facebookLoginResult = await FacebookAuth.instance.login(permissions: ['email' , 'public_profile','photoURL','name']);
      final userInfo = await FacebookAuth.instance.getUserData();
      final credential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(credential);
      update();
    }catch(C){debugPrint(C.toString());}
  }

  Future googleLogin ()async {
  try{
    final googleUserAccount = await googleSignIn.signIn();
    if(googleUserAccount == null) return;
    _userInfo = googleUserAccount;
    debugPrint('user email : ' + userInfo.email + 'user ');

    final googleAuth = await googleUserAccount.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    // Get.to(const HomeScreen());
    update();

  }catch(e){debugPrint(e.toString());}
  }

  Future logout()async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }

}
