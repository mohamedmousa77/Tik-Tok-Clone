import 'package:flutter/material.dart';
import 'package:tiktiok/pages/video_player_screen.dart';
import '../constant/json_data.dart';
import '../widgets/footer_home_screen.dart';

class FollowingScreen extends StatefulWidget {
   FollowingScreen({Key? key,required this.pageIndex}) : super(key: key);
final int pageIndex;
  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:getBody(),
      // bottomNavigationBar: getFooter(context),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
          controller: _tabController,
          children: List.generate(items.length, (index) {
            return RotatedBox(
              quarterTurns: -1,
              child: VideoPlayerItem(
                size: size,
                pageIndex : widget.pageIndex,
                save: items[index]['comments'],
                name: items[index]['name'],
                caption: items[index]['caption'],
                songName: items[index]['songName'],
                videoUrl: items[index]['videoUrl'],
                profileImag: items[index]['profileImg'],
                likes: items[index]['likes'],
                comments: items[index]['comments'],
                shares: items[index]['shares'],
                albumImg: items[index]['albumImg'],
              ),
            );
          })),
    );
  }
}
