import 'package:cogxrlabs_task/screens/image_screen.dart';
import 'package:cogxrlabs_task/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  bool _isLoading = true;
  late CameraController _cameraController;

  @override
  void initState() {
    _initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  _initCamera() async {
    final cameras = await availableCameras();
    final front = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front);
    _cameraController = CameraController(front, ResolutionPreset.max);
    await _cameraController.initialize();
    setState(() => _isLoading = false);
  }

  _takeImage() async {
    try {
      await _initCamera();
      final image = await _cameraController.takePicture();
      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ImageScreen(
            filePath: image.path,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: CameraPreview(
                    _cameraController,
                    child: Container(
                      margin: const EdgeInsets.all(40),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: SizedBox(
                child: Center(
                  child: MaterialButton(
                    onPressed: () => _takeImage(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Take Picture",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      );
    }
  }
}
