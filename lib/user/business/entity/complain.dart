import 'dart:convert';
import 'package:flutter/foundation.dart';

@immutable
class Complain {
  const Complain({required this.complain, required this.compcat});
  final String complain;
  final List<String> compcat;

  factory Complain.fromJson({required Map<String, dynamic> responseBody}) {
    String respnseMessage = responseBody['choices'][0]['message']['content'];
    String decoded = utf8.decode(latin1.encode(respnseMessage));
    RegExp regExp = RegExp(r'\d\. ([^:]+):');
    Iterable<RegExpMatch> matches = regExp.allMatches(respnseMessage);
    List<String> catigories = matches.map((match) => match.group(1)!.trim()).toList();
    return Complain(complain: decoded, compcat: catigories);
  }
}
