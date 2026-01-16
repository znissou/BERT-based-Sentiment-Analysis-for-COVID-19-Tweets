import 'dart:convert';
import 'package:http/http.dart' as http;

class SentimentService {
  // For Android emulator, use 10.0.2.2 to access localhost
  // For iOS simulator, use localhost or 127.0.0.1
  // For physical device, use your computer's IP address
  static const String baseUrl = 'http://10.0.2.2:5000';

  Future<String> classifySentiment(String text) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/classify'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': text}),
      ).timeout(
        const Duration(seconds: 10),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['sentiment'] as String;
      } else {
        throw Exception('Server returned status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }
}
