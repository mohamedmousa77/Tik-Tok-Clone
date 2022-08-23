import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/color.dart';
import '../widgets/footer_home_screen.dart';
import 'for_you_screen.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  final _userInfo = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHeader(),
      bottomNavigationBar: getFooter(context, pageIndex: 1),
    );
  }

  Widget getHeader() {
    return Column(
      children: [
        // header
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04),
                  child: Image.asset(
                    'assets/images/add_friend_icon.png',
                    height: 20,
                    width: 20,
                  )),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2,
                    right: MediaQuery.of(context).size.width * 0.15),
                child: Text(
                  _userInfo.displayName!.isEmpty
                      ? 'Mohamed Mousa'
                      : _userInfo.displayName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                // color: Colors.pink,
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Image.asset('assets/images/show_icon.png'),
              ),
              const Icon(Icons.menu, size: 25)
            ],
          ),
        ),
        //profile image
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _userInfo.photoURL!.isNotEmpty
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(_userInfo.photoURL!),
                          radius: 50,
                          // backgroundColor: Colors.pink,
                        )
                      : const CircleAvatar(
                          child: Text(
                            'M',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: white,
                                fontSize: 75),
                          ),
                          radius: 50,
                          backgroundColor: Colors.pink,
                        ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  Text(
                    _userInfo.displayName!.isNotEmpty
                        ? '@' + _userInfo.displayName!.trim().toLowerCase()
                        :  '@' + '',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  )
                ],
              )
            ],
          ),
        ),
        //
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    '241',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text('Following',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400))
                ],
              ),
              // Text('|' ,style: TextStyle(fontWeight: FontWeight.w100,fontSize: 10,color: Colors.grey)),
              // SizedBox(width: MediaQuery.of(context).size.width*0.01),
              // Spacer(flex: 1),
              Column(
                children: [
                  const Text(
                    '241',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text(
                    'Followers',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              // SizedBox(width: MediaQuery.of(context).size.width*0.01),
              // Spacer(flex: 1),
              Column(
                children: [
                  const Text(
                    '241',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  const Text('Likes',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400))
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.05),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.blueGrey[400]!, width: 2)),
              child: const Center(
                  child: Text(
                'Edit profile',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ))),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RotatedBox(quarterTurns: -1, child: Icon(Icons.menu)),
              SvgPicture.asset(
                'assets/images/lock_icon.svg',
                color: Colors.black,
                height: 20,
                width: 30,
              ),
              // Image.asset(
              //   'assets/images/save_icon.png',
              //   color: Colors.black,
              //   height: 20,
              //   width: 20,
              // ),
              const Icon(Icons.turned_in_not),
              const Icon(Icons.favorite_border)
            ],
          ),
        ),
      ],
    );
  }
}
