import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user_model.dart';
import '../utils/config.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<List<User>> getUsers() async {
    final http.Response response = await _client.get(Uri.parse(Config.baseUrl));
    final parsed = jsonDecode(response.body);
    final userList = parsed.map<User>((e) => User.fromJson(e)).toList();
    return userList;
  }
}
