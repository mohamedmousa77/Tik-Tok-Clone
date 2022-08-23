import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/color.dart';
import 'package:like_button/like_button.dart';

class RightPanel extends StatefulWidget {
  final String videoUrl;
  final String profileImg;
  final String likes;
  final String comments;
  final String save;
  final String shares;
  final String albumImg;
  final Size size;

  const RightPanel(
      {Key? key,
        required this.videoUrl,
      required this.save,
      required this.profileImg,
      required this.likes,
      required this.comments,
      required this.shares,
      required this.albumImg,
      required this.size})
      : super(key: key);

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            // height: size.height * 0.5,
            width: widget.size.width,
            padding: EdgeInsets.only(top: widget.size.height * 0.05),
            // color: Colors.red,
            child: Column(
              children: [
                getProfile(widget.size, widget.profileImg),
                buildLikeIcon(widget.size, Icons.favorite, widget.likes),
                SizedBox(height: widget.size.height * 0.02),
                buildCommentButtonSheet(
                    widget.size, Icons.chat_rounded, widget.comments),
                SizedBox(height: widget.size.height * 0.02),
                buildSaveIcon(widget.size, Icons.save, widget.comments),
                SizedBox(height: widget.size.height * 0.02),
                buildShareIcon(widget.size),
                SizedBox(height: widget.size.height * 0.02),
                getAlbum(widget.size, widget.albumImg),
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

  Widget buildCommentButtonSheet(Size size, icon, String count) {
    int countList = 5;
    return Column(
      children: [
        GestureDetector(
            onTap: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) => Column(
                  children: [
                     buildCommentHeader(count),
                    Container(
                      height: size.height*0.43,
                      child: ListView(
                        children: List.generate(
                            (countList-2),(index)=>buildCommentBody()
                        ),
                      ),
                    ),
                  const Divider(color: Colors.grey,height: 2),
                   buildCommentField()
                  ],
                )


            ),
            child: SvgPicture.asset(
              'assets/images/comment_icon.svg',
              color: white,
              height: 30,
              width: 30,
            )),
        // SizedBox(height: size.height*0.0),
        Text(count,
            style: const TextStyle(color: white, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget buildCommentHeader(String count) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.01,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        // mainAxisAlignment:
        //     MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.31,
                right: MediaQuery.of(context).size.width * 0.35),
            child: Text('$count Comments'),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/images/cross.svg',
              color: Colors.black54,
              height: 10,
              width: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget buildCommentBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04,
          top: MediaQuery.of(context).size.height*0.02),
          child: const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            child: Text('H'),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Name
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Text(
                'House of Highlights ',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            //comment
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              width: MediaQuery.of(context).size.width * 0.75,
              child: const Text(
                'She scored 90+ in that single game 😩',
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            )
          ],
        ),
        Column(
          children: [
            LikeButton(
              circleColor: const CircleColor(
                start: Colors.red,
                end: Colors.red,
              ),
              bubblesColor: const BubblesColor(
                  dotPrimaryColor: Colors.red, dotSecondaryColor: Colors.red),
              likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey[400],
                  size: 20,
                );
              },
            ),
            Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.01),
                child: const Text('5'))
          ],
        )
      ],
    );
  }

  Widget buildCommentField() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            margin: EdgeInsets.only(top: size.height*0.02,
            right: size.width*0.02),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.pink,
              child: Text('M'),
            ),
          ),
          Container(
            padding:const EdgeInsets.all(10),
            margin: EdgeInsets.only(
                top: size.height * 0.02),
            height: size.height * 0.05,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: ofWhiteColor, borderRadius: BorderRadius.circular(5)),
            child: TextFormField(
              onChanged: (newValue){
                // Get.find<PostController>().phoneNumber = newValue;
              },
              cursorColor: greyColor,
              decoration: InputDecoration(

                hintText: 'Add comment...',
                  hintStyle:  TextStyle(fontSize: 15,color: greyColor),
                //   labelText:  Get.find<PostController>().phoneNumber.toString(),
                //   labelStyle: TextStyle(fontSize: 15,color: greyColor),
                  border: InputBorder.none,
              ),

              // controller: postController.phoneNumberController,

              // style:  TextStyle(color:darkColor),
              // keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShareIcon(Size size) {
    final box = context.findRenderObject() as RenderBox?;
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Share.share(widget.videoUrl,
              // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size
              );
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content: Text("Share result: "),
              // ));

            },
            child: SvgPicture.asset(
              'assets/images/share_icon.svg',
              height: 30,
              width: 30,
              color: white,
            )
            ),
        // SizedBox(height: size.height*0.0),
        Text( widget.shares,
            style: const TextStyle(color: white, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget buildLikeIcon(Size size, icon, String count) {
    return Column(
      children: [
        LikeButton(
          circleColor: const CircleColor(
            start: Colors.red,
            end: Colors.red,
          ),
          bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.red, dotSecondaryColor: Colors.red),
          likeBuilder: (bool isLiked) {
            return Container(
              child: Icon(
                icon,
                color: isLiked ? Colors.red : white,
                size: 30,
              ),
            );
          },
        ),
        Text(
            // isLiked?((int.parse(count)+1).toString()):
            count,
            style: const TextStyle(color: white, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget buildSaveIcon(Size size, icon, String count) {
    return Column(
      children: [
        LikeButton(
          circleColor: const CircleColor(
            start: Colors.yellow,
            end: Colors.yellow,
          ),
          bubblesColor: const BubblesColor(
              dotPrimaryColor: Colors.yellow, dotSecondaryColor: Colors.yellow),
          likeBuilder: (bool isLiked) {
            return Container(
              child: Image.asset(
                'assets/images/save_icon.png',
                color: isLiked ? Colors.yellow : white,
              ),
            );
          },
          // countBuilder: (int count, bool isLiked, String text) {
          //   var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
          //   Widget result;
          //   if (count == 0) {
          //     result = Text(
          //       "love",
          //       style: TextStyle(color: color),
          //     );
          //   } else
          //     result = Text(
          //       text,
          //       style: TextStyle(color: color),
          //     );
          //   return result;
          // },
        ),
        Text(
            // isLiked?((int.parse(count)+1).toString()):
            count,
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
