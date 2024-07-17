import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

final logger = Logger();

Future<void> generateBabyImage(String apiKey, List<String> imageUrls) async {
  final response = await http.post(
    Uri.parse('https://your-ai-endpoint'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'apiKey': apiKey,
      'images': imageUrls,
    }),
  );

  if (response.statusCode == 200) {
    logger.i('Baby image generated successfully');
  } else {
    logger.e('Failed to generate baby image');
  }
}
