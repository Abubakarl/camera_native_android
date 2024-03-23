import 'dart:developer';
import 'dart:ui';
import 'package:camera_native_android/main.dart';
import 'package:get/get.dart';

initiateCamera(VoidCallback callback) async {
  log("Controller is ${controller == null}");
  await controller!.initialize().onError((error, stackTrace) {
    cameraState.isBackCameraInitialized.value = false;
    log(error.toString());
  }).then((value) {
    cameraState.isBackCameraInitialized.value = true;
    log("Controller initialized ${controller!.value.isInitialized}");
  });
  log("Camera initiated");
}

disposeCamera() async {
  await controller!.dispose();
}
class CameraState {
  RxBool isBackCameraInitialized = false.obs;
}