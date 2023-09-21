import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
class Authentications {
  
Future<String> authenticate() async {
  const String url = 'https://api.makcorps.com/auth';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  final Map<String, String> payload = {
    'username': 'checker',
    'password': 'chase polo',
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: json.encode(payload),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final String accessToken = data['access_token'];
    return accessToken;
  } else {
    log('Request failed with status: ${response.statusCode}');
    return '';
  }
}
}
