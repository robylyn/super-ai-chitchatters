import 'package:http/http.dart' as http;

final logger = Logger();

class Logger {
  void i(String s) {}

  void e(String s) {}
}

Future<void> generateImage(String apiKey, String imageUrl) async {
  final response = await http.post(
    Uri.parse('https://vision.googleapis.com/v1/images:annotate?key=$apiKey'),
    headers: {'Content-Type': 'application/json'},
    body:
        '{"requests":[{"image":{"source":{"imageUri":"$imageUrl"}},"features":[{"type":"LABEL_DETECTION"}]}]}',
  );

  if (response.statusCode == 200) {
    logger.i('Image processed successfully');
  } else {
    logger.e('Failed to process image');
  }
}
