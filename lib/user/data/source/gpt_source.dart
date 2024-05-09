import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@immutable
class GPTAPI {
  const GPTAPI();

  Future<bool> load() async {
    try {
      await dotenv.load(fileName: '.env');
      return true;
    } catch (e) {
      log("Fail to load environemnt file: $e");
    }
    return false;
  }

  Future<String> getAPI() async => await dotenv.get("GPT_API");
  Future<String> getKEY() async => await dotenv.get("GPT_KEY");
}
