import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktiok/constant/json_data.dart';
import 'package:tiktiok/theme/color.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
    return getBody();
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

  const VideoPlayerItem(
      {required this.size,
      Key? key,
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
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
       setState(() {
         _videoPlayerController.value.isPlaying
             ? _videoPlayerController.pause()
             : _videoPlayerController.play();
       });
      },
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: VideoPlayer(_videoPlayerController),
          ),
          Container(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.1),
                child: Column(
                  children: [
                    headerHomePage(),
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
                            albumImg: widget.albumImg,
                            comments: widget.comments,
                            likes: widget.likes,
                            profileImag: widget.profileImag,
                            shares: widget.shares,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget headerHomePage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Following',
          style: TextStyle(fontSize: 16, color: white.withOpacity(0.5)),
        ),
        SizedBox(width: widget.size.width * 0.02),
        Text(
          '|',
          style: TextStyle(fontSize: 16, color: white.withOpacity(0.5)),
        ),
        SizedBox(width: widget.size.width * 0.02),
        const Text(
          'For You',
          style: TextStyle(color: white, fontSize: 17),
        )
      ],
    );
  }
}

class RightPanel extends StatelessWidget {
  final String profileImag;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final Size size;

  const RightPanel(
      {Key? key,
      required this.profileImag,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.albumImg,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: size.height * 0.5,
            width: size.width,
            child: Column(
              children: [
                getProfile(size, profileImag),
                getIcon(size, Icons.favorite, likes),
                SizedBox(height: size.height * 0.02),
                getIcon(size, Icons.chat_rounded, comments),
                SizedBox(height: size.height * 0.02),
                getIcon(size, Icons.share, shares),
                SizedBox(height: size.height * 0.02),
                getAlbum(size, albumImg),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getProfile(Size size, String profileImg) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.1,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            border: Border.all(color: white),
            color: white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(profileImg),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            // height: size.height * 0.05,
            // width: size.width * 0.05,
            bottom: 0,
            left: size.width * 0.03,
            child: Container(
                height: size.height * 0.05,
                width: size.width * 0.05,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: primary),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  size: 16,
                  color: white,
                ))))
      ],
    );
  }

  Widget getIcon(Size size, icon, String count) {
    return Column(
      children: [
        Icon(
          icon,
          color: white,
          size: 30,
        ),
        // SizedBox(height: size.height*0.0),
        Text(count,
            style: const TextStyle(color: white, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget getAlbum(Size size, String albumImage) {
    return Container(
      height: size.height * 0.1,
      width: size.width * 0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: black,
          image: DecorationImage(
              image: NetworkImage(albumImage), fit: BoxFit.cover)),
    );
  }
}

class LeftPanel extends StatelessWidget {
  final String name;

  final String caption;

  final String songName;
  final Size size;

  const LeftPanel({
    Key? key,
    required this.name,
    required this.caption,
    required this.songName,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: const TextStyle(
                color: white,
              )),
          SizedBox(height: size.height * 0.02),
          Text(caption,
              style: const TextStyle(
                color: white,
              )),
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              const Icon(Icons.music_note, color: white, size: 15),
              Text(
                songName,
                style: const TextStyle(color: white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
