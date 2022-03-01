import 'package:flutter/material.dart';
import 'package:tiktiok/theme/color.dart';
import 'package:tiktiok/widgets/tik_tok_icons.dart';
import 'package:tiktiok/widgets/upload_icon.dart';

import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children:const [
        HomePage(),
        Center(
          child: Text('Discover',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
        ),
        Center(
          child: Text('Upload',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
        ),
        Center(
          child: Text('inbox',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
        ),
        Center(
          child: Text('Profile',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),),
        )
      ],
    );
}
  Widget getFooter() {
    List bottomItem = [
      {
        'icon': Icons.home,
        'label': 'Home',
        'isIcon': true,
      },
      {
        'icon': Icons.search,
        'label': 'Discover',
        'isIcon': true,
      },
      {
        'icon': '',
        'label': '',
        'isIcon': false,
      },
      {
        'icon': Icons.favorite,
        'label': 'Inbox',
        'isIcon': true,
      },
      {
        'icon': Icons.person,
        'label': 'Me',
        'isIcon': true,
      }
    ];
    return Container(
      // height: MediaQuery.of(context).size.height * 0.05,
      height: 80,
      width: MediaQuery.of(context).size.width,
      color: appBgColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(bottomItem.length, (index) {
            return bottomItem[index]['isIcon']
                ? InkWell(
              onTap: (){
                selectedIndex (index);
              },
                  child: Column(
                      children: [
                        Icon(
                          bottomItem[index]['icon'],
                          color: white,
                          // size: 20,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          bottomItem[index]['label'],
                          style: const TextStyle(
                            color: white,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                )
                : InkWell(
                onTap: (){
                  selectedIndex(index);
                },
                child:  UploadIcon());
          }),
        ),
      ),
    );
  }
  int pageIndex=0;
  selectedIndex (int index){
    setState(() {
      pageIndex = index;
    });
  }
}
