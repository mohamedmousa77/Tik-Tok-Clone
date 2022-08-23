import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/color.dart';
import 'for_you_screen.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // final String name;
  // final String imageUrl;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getHeader(),
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
              IconButton(
                  onPressed: () {
                    Get.to(const HomeScreen());
                  },
                  icon: const Icon(Icons.arrow_back)),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.2,
                    right: MediaQuery.of(context).size.width * 0.2),
                child: const Text(
                  'Vannak Niza🦋',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Image.asset(
                  'assets/images/notification-icon.png',
                  height: 20,
                  width: 20,
                ),
              ),
              const Icon(Icons.drag_indicator, size: 20)
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
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        // widget.imageUrl
                        'https://p16-tiktokcdn-com.akamaized.net/aweme/720x720/tiktok-obj/1663771856684033.jpeg'),
                    radius: 50,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    '@' + 'Vannak Niza🦋'.trim().toLowerCase(),
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
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.redAccent[400],
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                    child: Text(
                  'Follow',
                  style: TextStyle(
                      fontSize: 20, color: white, fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return Container();
  }
}
