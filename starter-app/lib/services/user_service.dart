import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../utils/constants.dart';

class UserService {
  static Future<User> fetchUser(int userId) async {
    // Artificial slow response to simulate our real flaky profile endpoint.
    await Future.delayed(const Duration(seconds: 2));

    final resp = await http.get(
      Uri.parse('${AppConstants.usersApiBase}/users/$userId'),
    );

    if (resp.statusCode != 200) {
      throw Exception('Failed to load user: ${resp.statusCode}');
    }

    final json = jsonDecode(resp.body) as Map<String, dynamic>;
    return User.fromJsonPlaceholder(json);
  }

  /// TODO: This endpoint does not exist on the backend yet.
  /// The product team wants a "this week's insights" section on Profile,
  /// but the backend team has not built GET /home/insights/:userId.
  /// Needs a frontend strategy.
  static Future<Map<String, dynamic>> fetchInsights(int userId) async {
    throw UnimplementedError(
      'GET /home/insights/$userId not implemented on backend',
    );
  }
}
