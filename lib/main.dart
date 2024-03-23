import 'package:camera_native_android/cameras/back_camera.dart';
import 'package:camera_native_android/state/camera_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

import 'cameras/front_camera.dart';
CameraState cameraState = Get.put(CameraState());
List<CameraDescription> cameras = [];
CameraController? controller;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await availableCameras().then((value) {
    cameras = value;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraPage(),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // BackCamera(),
          FrontCamera(),
        ],
      ),
    );
  }
}
