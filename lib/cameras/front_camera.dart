import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FrontCamera extends StatefulWidget {
  const FrontCamera({super.key});

  @override
  State<FrontCamera> createState() => _FrontCameraState();
}

class _FrontCameraState extends State<FrontCamera> {
  @override
  void initState() {
    startCamera();
    super.initState();
  }
  @override
  void dispose() {
    stopCamera();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    const String viewType = '<camera_view>';
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    return SizedBox(
      height: Get.height/2,
      width: Get.width,
      child: ClipRect(
        child: Transform.scale(
          scale: 3 / 4,
          child: Center(
            child: AndroidView(
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          ),
        ),
      ),
    );
  }

  MethodChannel cameraChannel = const MethodChannel("CameraController");

  Future<void> startCamera() async {
    await cameraChannel.invokeMethod("startSession");
    setState(() {});
  }

  Future<void> stopCamera() async {
    await cameraChannel.invokeMethod("stopSession");
    setState(() {});
  }
}
