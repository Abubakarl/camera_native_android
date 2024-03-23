import 'package:camera/camera.dart';
import 'package:camera_native_android/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/state/camera_state.dart';

class BackCamera extends StatefulWidget {
  const BackCamera({super.key});

  @override
  State<BackCamera> createState() => _BackCameraState();
}

class _BackCameraState extends State<BackCamera> {
  @override
  void initState() {
    initiateCamera(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cameraState.isBackCameraInitialized.value) {
        return SizedBox(
          height: Get.height / 2,
          width: Get.width,
          child: ClipRect(
            child: Transform.scale(
              scale: controller!.value.aspectRatio,
              child: Center(
                child: CameraPreview(controller!),
              ),
            ),
          ),
        );
      } else {
        return Expanded(
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text("Camera not initialized yet"),
            ),
          ),
        );
      }
    });
  }
}
