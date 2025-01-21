import 'dart:convert';

import 'package:chatapp/features/conversation/data/model/conversation_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ConversationRemoteDataSource {
  final String baseUrl = "http://localhost:6000";
  final _storage = const FlutterSecureStorage();

  Future<List<ConversationModel>> fetchConversations() async {
    String token = await _storage.read(key: 'token') ?? '';
    final response = await http.get(Uri.parse('$baseUrl/conversations'),
        headers: {'Authorization': 'Bearer $token'});
    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => ConversationModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch conversations');
    }
  }
}
