import 'dart:convert';

import 'package:bank_sha/models/tip_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TipService {
  Future<List<TipsModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        List<TipsModel> tips = List<TipsModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipsModel.fromJson(tip),
          ),
        ).toList();

        return tips;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
