// import 'package:camera_deep_ar/camera_deep_ar.dart';
// import 'dart:io';
//
// import 'package:camera_deep_ar/camera_deep_ar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';
//
// import 'config.dart';
//
// const apiKey =
// "f8938e5d4391f684e9ebdfe419c90cad1559ecb86326e809652bc3b32b11a25480ad604f1b9d9caa";
//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   final deepArController = CameraDeepArController(config);
//   String _platformVersion = 'Unknown';
//   bool isRecording = false;
//   late CameraMode cameraMode;
//   late DisplayMode displayMode ;
//   int currentEffect = 0;
//   List effects = [
//     "none",
//     "assets/fire",
//     "assets/heart",
//     "assets/blizzard",
//     "assets/rain",
//   ];
//   List filters = [
//     "none",
//     "assets/drawingmanga",
//     "assets/sepia",
//     "assets/bleachbypass",
//     "assets/realvhs",
//     "assets/filmcolorperfection"
//   ];
//   List masks = [
//     "none",
//     "assets/aviators",
//     "assets/bigmouth",
//     "assets/lion",
//     "assets/dalmatian",
//     "assets/bcgseg",
//     "assets/look2",
//     "assets/fatify",
//     "assets/flowers",
//     "assets/grumpycat",
//     "assets/koala",
//     "assets/mudmask",
//     "assets/obama",
//     "assets/pug",
//     "assets/slash",
//     "assets/sleepingmask",
//     "assets/smallface",
//     "assets/teddycigar",
//     "assets/tripleface",
//     "assets/twistedface",
//   ];
//   @override
//   void initState() {
//     super.initState();
//     final deepArController = CameraDeepArController(config);
//      cameraMode = config.cameraMode;
//      displayMode = config.displayMode;
//     CameraDeepArController.checkPermissions();
//     deepArController.setEventHandler(DeepArEventHandler(onCameraReady: (v) {
//       _platformVersion = "onCameraReady $v";
//       setState(() {});
//     }, onSnapPhotoCompleted: (v) {
//       _platformVersion = "onSnapPhotoCompleted $v";
//       setState(() {});
//     }, onVideoRecordingComplete: (v) {
//       _platformVersion = "onVideoRecordingComplete $v";
//       setState(() {});
//     }, onSwitchEffect: (v) {
//       _platformVersion = "onSwitchEffect $v";
//       setState(() {});
//     }));
//
//   }
//
//   @override
//   void dispose() {
//     deepArController.dispose();
//     super.dispose();
//
//   }
//
//   DeepArConfig config =const DeepArConfig(
//     androidKey:
//     "3b58c448bd650192e7c53d965cfe5dc1c341d2568b663a3962b7517c4ac6eeed0ba1fb2afe491a4b",
//     ioskey:
//     "53618212114fc16bbd7499c0c04c2ca11a4eed188dc20ed62a7f7eec02b41cb34d638e72945a6bf6",
//     displayMode: DisplayMode.camera,
// // displayMode: DisplayMode.camera,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('DeepAR Camera Example'),
//       ),
//       body: Stack(
//         children: [
//
//           DeepArPreview(deepArController),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               padding: EdgeInsets.all(20),
//               //height: 250,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'Response >>> : $_platformVersion\n',
//                     textAlign: TextAlign.center,
//                     style:const TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                  const SizedBox(height: 20,),
//                   Container(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: FlatButton(
//                             onPressed: () {
//                               if (null == deepArController) return;
//                               if (isRecording) return;
//                               deepArController.snapPhoto();
//                             },
//                             child: Icon(Icons.camera_enhance_outlined),
//                             color: Colors.white,
//                             padding: EdgeInsets.all(15),
//                           ),
//                         ),
//                         if (displayMode == DisplayMode.image)
//                           Expanded(
//                             child: FlatButton(
//                               onPressed: () async {
//                                 String path = "assets/testImage.png";
//                                 final file = await deepArController
//                                     .createFileFromAsset(path, "test");
//
//                                 // final file = await ImagePicker()
//                                 //     .pickImage(source: ImageSource.gallery);
//                                 await Future.delayed(Duration(seconds: 1));
//
//                                 deepArController.changeImage(file.path);
//                                 print("DAMON - Calling Change Image Flutter");
//                               },
//                               child: Icon(Icons.image),
//                               color: Colors.orange,
//                               padding: EdgeInsets.all(15),
//                             ),
//                           ),
//                         if (isRecording)
//                           Expanded(
//                             child: FlatButton(
//                               onPressed: () {
//                                 if (null == deepArController) return;
//                                 deepArController.stopVideoRecording();
//                                 isRecording = false;
//                                 setState(() {});
//                               },
//                               child: Icon(Icons.videocam_off),
//                               color: Colors.red,
//                               padding: EdgeInsets.all(15),
//                             ),
//                           )
//                         else
//                           Expanded(
//                             child: FlatButton(
//                               onPressed: () {
//                                 if (null == deepArController) return;
//                                 deepArController.startVideoRecording();
//                                 isRecording = true;
//                                 setState(() {});
//                               },
//                               child: Icon(Icons.videocam),
//                               color: Colors.green,
//                               padding: EdgeInsets.all(15),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SingleChildScrollView(
//                     padding: EdgeInsets.all(15),
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: List.generate(effectList.length, (p) {
//                         bool active = currentEffect == p;
//                         String imgPath = effectList[p];
//                         return GestureDetector(
//                           onTap: () async {
//                             if (!deepArController.value.isInitialized) return;
//                             currentEffect = p;
//                             deepArController.switchEffect(
//                                 cameraMode, imgPath);
//                             setState(() {});
//                           },
//                           child: Container(
//                             margin: EdgeInsets.all(6),
//                             width: active ? 70 : 55,
//                             height: active ? 70 : 55,
//                             alignment: Alignment.center,
//                             child: Text(
//                               "$p",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontWeight: active ? FontWeight.bold : null,
//                                   fontSize: active ? 16 : 14,
//                                   color:
//                                   active ? Colors.white : Colors.black),
//                             ),
//                             decoration: BoxDecoration(
//                                 color: active ? Colors.orange : Colors.white,
//                                 border: Border.all(
//                                     color:
//                                     active ? Colors.orange : Colors.white,
//                                     width: active ? 2 : 0),
//                                 shape: BoxShape.circle),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: List.generate(CameraMode.values.length, (p) {
//                       CameraMode mode = CameraMode.values[p];
//                       bool active = cameraMode == mode;
//
//                       return Expanded(
//                         child: Container(
//                           height: 40,
//                           margin:const EdgeInsets.all(2),
//                           child: TextButton(
//                             onPressed: () async {
//                               cameraMode = mode;
//                               setState(() {});
//                             },
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.black,
//                               primary: Colors.black,
//                               // shape: CircleBorder(
//                               //     side: BorderSide(
//                               //         color: Colors.white, width: 3))
//                             ),
//                             child: Text(
//                               'describeEnum(mode)',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontWeight: active ? FontWeight.bold : null,
//                                   fontSize: active ? 16 : 14,
//                                   color: Colors.white
//                                       .withOpacity(active ? 1 : 0.6)),
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                   const SizedBox(height: 5,),
//                   Row(
//                     children: List.generate(DisplayMode.values.length, (p) {
//                       DisplayMode mode = DisplayMode.values[p];
//                       bool active = displayMode == mode;
//
//                       return Expanded(
//                         child: Container(
//                           height: 40,
//                           margin:const EdgeInsets.all(2),
//                           child: TextButton(
//                             onPressed: () async {
//                               displayMode = mode;
//                               await deepArController.setDisplayMode(
//                                   mode: mode);
//                               setState(() {});
//                             },
//                             style: TextButton.styleFrom(
//                               backgroundColor: Colors.purple,
//                               primary: Colors.black,
//                               // shape: CircleBorder(
//                               //     side: BorderSide(
//                               //         color: Colors.white, width: 3))
//                             ),
//                             child: Text(
//                               'describeEnum(mode)',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontWeight: active ? FontWeight.bold : null,
//                                   fontSize: active ? 16 : 14,
//                                   color: Colors.white
//                                       .withOpacity(active ? 1 : 0.6)),
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//
//     );
//   }
//
//
//
//   List get effectList {
//     switch (cameraMode) {
//       case CameraMode.mask:
//         return masks;
//         break;
//       case CameraMode.effect:
//         return effects;
//         break;
//
//       case CameraMode.filter:
//         return filters;
//         break;
//       default:
//         return masks;
//     }
//   }
//
//   static Future<File> _loadFile(String path, String name) async {
//     final ByteData data = await rootBundle.load(path);
//     Directory tempDir = await getTemporaryDirectory();
//     File tempFile = File('${tempDir.path}/$name');
//     await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
//     return tempFile;
//   }
//
//
// }
//


import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:camera_deep_ar/camera_deep_ar.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//
//   String _platformVersion = 'Unknown';
//   CameraDeepArController ? cameraDeepArController;
//   int currentPage = 0;
//   final vp = PageController(viewportFraction: .24);
//   bool isRecording = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: const Text('DeepAR Camera Example'),
//         ),
//         body: Stack(
//           children: [
//             CameraDeepAr(
//                 onCameraReady: (isReady) {
//                   _platformVersion = "Camera status $isReady";
//                   setState(() {});
//                 },
//                 onImageCaptured: (path) {
//                   _platformVersion = "Image Taken @ $path";
//                   setState(() {});
//                 },
//                 onVideoRecorded: (path) {
//                   _platformVersion = "Video Recorded @ $path";
//                   isRecording = false;
//                   setState(() {});
//                 },
//                 androidLicenceKey:'apiKey',
//                 iosLicenceKey:'apiKey',
//           cameraDeepArCallback: (c) async {
//                   cameraDeepArController = c;
//                   setState(() {});
//                 }),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 //height: 250,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'Response >>> : $_platformVersion\n',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: FlatButton(
//                             onPressed: () {
//                               if (null == cameraDeepArController) return;
//                               if (isRecording) return;
//                               cameraDeepArController.snapPhoto();
//                             },
//                             child: Icon(Icons.camera_enhance_outlined),
//                             color: Colors.white,
//                             padding: EdgeInsets.all(15),
//                           ),
//                         ),
//                         if (isRecording)
//                           Expanded(
//                             child: FlatButton(
//                               onPressed: () {
//                                 if (null == cameraDeepArController) return;
//                                 cameraDeepArController.stopVideoRecording();
//                                 isRecording = false;
//                                 setState(() {});
//                               },
//                               child: Icon(Icons.videocam_off),
//                               color: Colors.red,
//                               padding: EdgeInsets.all(15),
//                             ),
//                           )
//                         else
//                           Expanded(
//                             child: FlatButton(
//                               onPressed: () {
//                                 if (null == cameraDeepArController) return;
//                                 cameraDeepArController.startVideoRecording();
//                                 isRecording = true;
//                                 setState(() {});
//                               },
//                               child: Icon(Icons.videocam),
//                               color: Colors.green,
//                               padding: EdgeInsets.all(15),
//                             ),
//                           ),
//                       ],
//                     ),
//                     SingleChildScrollView(
//                       padding: EdgeInsets.all(15),
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(Masks.values.length, (p) {
//                           bool active = currentPage == p;
//                           return GestureDetector(
//                             onTap: () {
//                               currentPage = p;
//                               cameraDeepArController.changeMask(p);
//                               setState(() {});
//                             },
//                             child: Container(
//                                 margin: EdgeInsets.all(5),
//                                 padding: EdgeInsets.all(12),
//                                 width: active ? 100 : 80,
//                                 height: active ? 100 : 80,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color:
//                                     active ? Colors.orange : Colors.white,
//                                     shape: BoxShape.circle),
//                                 child: Text(
//                                   "$p",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: active ? 16 : 14,
//                                       color: Colors.black),
//                                 )),
//                           );
//                         }),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
// }
