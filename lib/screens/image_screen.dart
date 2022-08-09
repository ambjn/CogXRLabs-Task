import 'dart:io';

import 'package:cogxrlabs_task/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key, required this.filePath});
  final String filePath;

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        elevation: 0,
        backgroundColor: Colors.black26,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Image.file(File(widget.filePath)),
          Expanded(child: Container()),
          const CustomButton(
            color: Colors.blueGrey,
            height: 60,
            text: "Next",
            icon: Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}
