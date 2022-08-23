import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tiktiok/controller/user_controller.dart';
import 'package:tiktiok/pages/home_screen.dart';

import '../theme/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset >= 108.23529614159145) {
        controller.jumpTo(108.23529614159145);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.3,
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Text('Tik Tok\n  Clone'.toUpperCase(),
                style:const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: white,
                )),
          ),
          getBody()
        ],
      ),
    );
  }

  bool showPass = false;
  var controller = ScrollController();

  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.23,
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      decoration: BoxDecoration(
          color:white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: ofWhiteColor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // login text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Text('SignUp',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: primaryColor,
                      ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            // user name text field
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: userNameField()),
              ],
            ),
            //pass text field
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.05),
                    // child: passwordField(context, 'Password')
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromRGBO(236, 238, 244, 1)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    // Get.find<UserController>().hidePassword();
                                    debugPrint('clicked!!!!!!');
                                    setState(() {
                                      showPass = !showPass;
                                    });
                                  },
                                  icon: showPass
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.remove_red_eye_sharp),
                                  color: greyColor),
                              icon: Icon(Icons.lock_outline, color: greyColor),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle:  const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(196, 198, 204, 1)),
                          ),
                          obscureText: showPass ? false : true,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) {},
                          onSaved: (value) {},
                        ),
                      ),
                    ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                GestureDetector(
                  onTap: (){
                    Get.find<UserController>().googleLogin();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                       ),
                    decoration: BoxDecoration(
                      color: ofWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child:const FaIcon(FontAwesomeIcons.google,size: 50,
                    color: Colors.red,),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                GestureDetector(
                  onTap: (){
                    Get.find<UserController>().faceBookLogin();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.height * 0.1,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: ofWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child:const FaIcon(FontAwesomeIcons.facebook,size: 50,
                    color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05),
                  // child: loginButton(context,'login')
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          'Sign Up'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget userNameField() {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(236, 238, 244, 1)),
      child: Center(
        child: TextFormField(
          decoration:const InputDecoration(
              icon:  Icon(Icons.person_outline,
                  color: Color.fromRGBO(196, 198, 204, 1)),
              border: InputBorder.none,
              hintText: 'Username',
              hintStyle:  TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(196, 198, 204, 1)),),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {},
          onSaved: (value) {},
        ),
      ),
    );
  }
}
