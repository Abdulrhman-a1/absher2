import 'dart:convert';
import 'dart:developer';
import 'package:absher/user/data/request/gpt_request.dart';
import 'package:http/http.dart' as http;
import 'package:absher/user/business/entity/complain.dart';
import 'package:absher/user/data/source/gpt_source.dart';

class GPTRepo {
  const GPTRepo();

  Future<Complain> analyzeComplain({required String complain}) async {
    try {
      GPTAPI _api = GPTAPI();
      final bool isLoaded = await _api.load();
      // Check if Environment variables are loaded
      if (!isLoaded) {
        throw Exception("عذراً حدث خطأ");
      }

      Uri _uri = Uri.parse(await _api.getAPI());
      GPTRequest request = GPTRequest();

      http.Response response = await http.post(
        _uri,
        headers: request.getHeaders(key: await _api.getKEY()),
        body: request.getBody(queryConent: complain),
      );

      if (response.statusCode != 200) {
        throw Exception("حدث خطأ أثناء معالجة البلاغ");
      }
      final Map<String, dynamic> body = jsonDecode(response.body);
      return Complain.fromJson(responseBody: body);
    } catch (e) {
      log("GPT Repo [Error]: ${e.toString()}");
      rethrow;
    }
  }
}
