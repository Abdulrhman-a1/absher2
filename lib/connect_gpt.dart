import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

@immutable
class Connect {
  const Connect();
  // API key here
  final String _apiSecret = "";

  Map<String, String> _setHeaders() => {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $_apiSecret"
      };

  Map<String, dynamic> _preparRequestBody({required String query}) => {
        "model": "gpt-4-turbo",
        'messages': [
          {
            "role": "system",
            "content": _formatQuery(query: query),
          }
        ],
      };

  Future<String> trigger({required String query}) async {
    try {
      String url = "https://api.openai.com/v1/chat/completions";
      Uri uri = Uri.parse(url);
      http.Response response = await http.post(uri,
          headers: _setHeaders(),
          body: jsonEncode(_preparRequestBody(query: query)));

      if (response.statusCode == 200) {
        log("Successful: ${response.statusCode}");
        Map<String, dynamic> body = jsonDecode(response.body);

        String message = utf8
            .decode(latin1.encode(body['choices'][0]['message']['content']));
        log("recieved: $message");

        return message;
      }
      log("Failed: ${response}");
    } catch (e) {
      log(e.toString());
    }
    return "Can not reach to chatGPT";
  }

  String _formatQuery({required String query}) {
    assert(query.isNotEmpty, 'Invalid query format.');

    return '''
سوف يتم ارسال لك بلاغ مقدم من شخص يجب عليك الرد عليه برسالة تتضمن التالي فقط: 
تحليل و اعادة صياغة البلاغ بطريقة واضحة و رسمية 
ارقام 3 اقتراحات للتصانيف المناسبة التي يندرج تحتها البلاغ بدون كتابة عنوان التصنيف فقط ارقامهم كالتالي: 1 2 7   
الرسالة المعروضة يجب ان لا تتضمن اي شي اخر غير الموضح اعلاه, هي رسالة و اقتراحات سوف تظهر للمتضرر الرجاء الالتزام بالتعليمات!! 
1- تحرش
2- امن دولة
3- اعتداء جسدي
4- ارهاب
5- اعتداء لفظي
6- تفحيط
7- اتجار بالبشر

مثال يجب اتباعه تماما:
يظهر في البلاغ ان شخص ما صدم شخص اخر بسيارته و هرب من موقع الحادث
1 5 6 
سوف تعطى بلاغ و يجب الرد بنفس الطريقة لمختلف البلاغات, حلل و لخص اولا ثم في نهاية رسالتك قم بكتابة الارقام
$query
''';
  }
}
