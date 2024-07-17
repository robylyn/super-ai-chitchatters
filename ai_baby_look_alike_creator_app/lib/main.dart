import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'services/generate_baby_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];

  Future<void> _pickImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    setState(() {
      _images = selectedImages;
    });
  }

  Future<void> _generateBabyImage() async {
    List<String> imageUrls = _images.map((image) => image.path).toList();
    String apiKey = "AIzaSyDc5b3iMDQOugohsiiS2kehMwDJWO9zswA";
    await generateBabyImage(apiKey, imageUrls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Baby Look-Alike Creator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImages,
              child: const Text('Pick Images'),
            ),
            ElevatedButton(
              onPressed: _generateBabyImage,
              child: const Text('Generate Baby Image'),
            ),
          ],
        ),
      ),
    );
  }
}
