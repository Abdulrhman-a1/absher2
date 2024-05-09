class GPTRequest {
  const GPTRequest();
  Map<String, String> getHeaders({required String key}) => {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $key"
      };

  Map<String, dynamic> getBody({required String queryConent}) => {
        "model": "gpt-4-turbo",
        'messages': [
          {
            "role": "system",
            "content": _formatQuery(queryConent: queryConent),
          }
        ],
      };

  String _formatQuery({required String queryConent}) {
    assert(queryConent.isNotEmpty, 'Invalid query format.');

    return '''
لخص البلاغ مع اعادة صياغته و قم باقتراح ٣ تصانيف وفق قانون الامن السعودي
$queryConent
''';
  }
}
