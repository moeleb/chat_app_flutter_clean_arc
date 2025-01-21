import 'dart:convert';

import 'package:chatapp/features/chat/data/models/message_model.dart';
import 'package:chatapp/features/chat/domain/entity/message_entity.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
class MessageRemoteDataSource {
  final String baseUrl = 'http://localhost:6000';
  final _storage = const FlutterSecureStorage();


  Future<List<MessageEntity>> fetchMessages(String conversationId) async {
    String token = await _storage.read(key: 'token')?? '';
    final response = await http.get(Uri.parse('$baseUrl/$conversationId'),
        headers: {'Authorization': 'Bearer $token'}
    );
    if(response.statusCode==200){
      List data = jsonDecode(response.body);
      return data.map((e)=>MessageModel.fromJson(e)).toList();
    }else{
      throw Exception('failed to fetch Messages');
    }
  }

}