import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktiok/controller/video_controller.dart';
import 'package:video_player/video_player.dart';

import '../widgets/header_home_screen.dart';
import '../widgets/left_panel.dart';
import '../widgets/right_panel.dart';


class VideoPlayerItem extends StatefulWidget {
  final Size size;

  final String profileImag;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final String name;
  final String caption;
  final String songName;
  final String videoUrl;
  final String save;
  final int pageIndex;

  const VideoPlayerItem(
      {
        required this.pageIndex,
        required this.size,
        Key? key,
        required this.save,
        required this.videoUrl,
        required this.profileImag,
        required this.likes,
        required this.comments,
        required this.shares,
        required this.albumImg,
        required this.name,
        required this.caption,
        required this.songName})
      : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    Get.find<VideoController>().addListener(() {
      if(Get.find<VideoController>().pageIndex !=0){
        _videoPlayerController.dispose();
      }
    });
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        if(widget.pageIndex == 0 || widget.pageIndex == 1){
          _videoPlayerController.play();
          setState(() {});
        }else{
          _videoPlayerController.dispose();
          setState(() {});
        }

      });
    _videoPlayerController.setLooping(true);

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }
  // bool isPause = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          setState(() {

            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();

            // _videoPlayerController.value.isPlaying
            //     ?isPause=false
            //     : isPause = true;
          });

        },

        child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: VideoPlayer(_videoPlayerController),
            ),
            _videoPlayerController.value.isPlaying
                ?Container()
                : Align(
              alignment:const Alignment(0,0.02),
              child:  Icon(Icons.play_arrow,color: Colors.white.withOpacity(0.7),size: 75,),
            ),
            // main screen content
            Container(
                height: size.height,
                width: size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.06),
                  child: Column(
                    children: [
                      headerHomePage(context,size:widget.size),
                      Flexible(
                        child: Row(
                          children: [
                            LeftPanel(
                              size: size,
                              name: widget.name,
                              caption: widget.caption,
                              songName: widget.songName,
                            ),
                            RightPanel(
                              size: size,
                              videoUrl: widget.videoUrl,
                              save: widget.save,
                              albumImg: widget.albumImg,
                              comments: widget.comments,
                              likes: widget.likes,
                              profileImg: widget.profileImag,
                              shares: widget.shares,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                )),
          ],
        ),
      ),
      // bottomNavigationBar: getFooter(),
    );
  }


}
