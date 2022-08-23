//
// import 'package:camera_deep_ar/camera_deep_ar.dart';
//
// DeepArConfig config = DeepArConfig(
// androidKey:
// "3b58c448bd650192e7c53d965cfe5dc1c341d2568b663a3962b7517c4ac6eeed0ba1fb2afe491a4b",
// ioskey:
// "53618212114fc16bbd7499c0c04c2ca11a4eed188dc20ed62a7f7eec02b41cb34d638e72945a6bf6",
// displayMode: DisplayMode.camera,
// // displayMode: DisplayMode.camera,
// );
//
//
// // ## Create the controller
//
// final deepArController = CameraDeepArController(config);
// String _platformVersion = 'Unknown';
// bool isRecording = false;
// CameraMode cameraMode = config.cameraMode;
// DisplayMode displayMode = config.displayMode;
//
//
// // ## Create the controller events listener
//
// deepArController.setEventHandler(DeepArEventHandler(onCameraReady: (v) {
// _platformVersion = "onCameraReady $v";
// setState(() {});
// }, onSnapPhotoCompleted: (v) {
// _platformVersion = "onSnapPhotoCompleted $v";
// setState(() {});
// }, onVideoRecordingComplete: (v) {
// _platformVersion = "onVideoRecordingComplete $v";
// setState(() {});
// }, onSwitchEffect: (v) {
// _platformVersion = "onSwitchEffect $v";
// setState(() {});
// }));
//
//
// ## Create DeepAR Camera preview widget
//
// DeepArPreview(deepArController),
//
//
// ## Controller Functions
//
// // To take photos
// deepArController.snapPhoto();
//
// // To start recording
// deepArController.startVideoRecording();
//
// // To switch effects
// deepArController.switchEffect(cameraMode, imgPath);
//
// // To stop video recording
// deepArController.stopVideoRecording();