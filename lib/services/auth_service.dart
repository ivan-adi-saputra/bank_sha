import 'dart:convert';

import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool?> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
        }),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        throw jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: data.toJson(),
      );

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.statusCode == 200) {
        final responseJson = jsonDecode(res.body) as Map<String, dynamic>;
        UserModel user = UserModel.fromJson(responseJson);
        user = user.copyWith(password: data.password);
        return user;
      } else {
        final responseJson = jsonDecode(res.body) as Map<String, dynamic>;
        final errorMessage =
            responseJson['message'] ?? 'Unknown error occurred';
        throw errorMessage;
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}
