import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import 'user_mapper.dart';
import '../utils/constants.dart';

class AuthResult {
  final bool success;
  final String? token;
  final String? error;

  AuthResult.ok(this.token)
      : success = true,
        error = null;
  AuthResult.fail(this.error)
      : success = false,
        token = null;
}

class AuthService {
  /// In-memory token storage. OK for this assignment.
  static String? currentToken;
  static User? currentUser;

  /// Calls the ReqRes mock login endpoint.
  /// ReqRes requires specific credentials; we map our UI 'phone' input to its
  /// expected email/password internally.
  static Future<AuthResult> login(String phone, String otp) async {
    // Very light OTP check — real app would hit /auth/otp/verify.
    if (otp != '1234') {
      return AuthResult.fail('Invalid OTP. Try 1234.');
    }

    try {
      final resp = await http.post(
        Uri.parse('${AppConstants.loginApiBase}/login'),
        headers: {
          'Content-Type': 'application/json',
          // ReqRes v1 requires an api key header as of 2024.
          'x-api-key': 'free_user_3DA3XAQBpXlL3bhLwEUWtwoHfkk',
        },
        body: jsonEncode({
          'email': 'eve.holt@reqres.in',
          'password': 'cityslicka',
        }),
      );

      if (resp.statusCode == 200) {
        final body = jsonDecode(resp.body) as Map<String, dynamic>;
        final token = body['token'] as String?;
        currentToken = token;
        currentUser = UserMapper.fromReqResLogin(body);
        return AuthResult.ok(token);
      }

      return AuthResult.fail(
        'Login failed (${resp.statusCode}). Please try again.',
      );
    } catch (e) {
      return AuthResult.fail('Network error: $e');
    }
  }

  static void logout() {
    currentToken = null;
    currentUser = null;
  }
}
