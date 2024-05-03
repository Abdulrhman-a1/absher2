import 'package:flutter/foundation.dart';

enum Suggestions {
  SH, //تحرش جنسي
  HLS, //امن دولة
  ASU, // اعتداء جسدي
  TRRSM, // ارهاب
  OFSP, // اعتداء لفظي
  DRF, // تفحيط و تجمهر
  HR, //اتجار بالبشر
}

@immutable
class FormateResponse {
  const FormateResponse({required this.response});
  final String response;

  List<Suggestions> getSuggestions() {
    List<Suggestions> sug = [];
    String last = response.substring(response.length - 5);

    for (int i = 0; i < last.length; i++) {
      switch (last[i]) {
        case "1":
          {
            sug.add(Suggestions.SH);
            break;
          }
        case "2":
          {
            sug.add(Suggestions.HLS);
            break;
          }
        case "3":
          {
            sug.add(Suggestions.ASU);
            break;
          }
        case "4":
          {
            sug.add(Suggestions.TRRSM);
            break;
          }
        case "5":
          {
            sug.add(Suggestions.OFSP);
            break;
          }
        case "6":
          {
            sug.add(Suggestions.DRF);
            break;
          }
        case "7":
          {
            sug.add(Suggestions.HR);
            break;
          }
      }
    }
    return sug;
  }

  String suggestionTitle({required Suggestions suggestion}) {
    if (suggestion == Suggestions.ASU) {
      return "اعتداء جسدي";
    } else if (suggestion == Suggestions.DRF) {
      return "تفحيط و تجمهر";
    } else if (suggestion == Suggestions.HLS) {
      return "امن دولة";
    } else if (suggestion == Suggestions.HR) {
      return "اتجار بالبشر";
    } else if (suggestion == Suggestions.OFSP) {
      return "اعتداء لفظي";
    } else if (suggestion == Suggestions.SH) {
      return "تحرش جنسي";
    } else if (suggestion == Suggestions.TRRSM) {
      return "ارهاب";
    }
    return "تآكيد";
  }
}
