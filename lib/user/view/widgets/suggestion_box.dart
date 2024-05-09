import 'package:flutter/material.dart';

class SuggestionBox extends StatelessWidget {
  const SuggestionBox({
    super.key,
    required this.text,
    required this.isture,
    required this.onTap,
  });
  final VoidCallback onTap;
  final bool isture;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: /* text == 'غير ذالك' ? AddNewSuggstion : */ onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: isture ? Color(0xFF71D286) : Color(0xFFB1B2B3)),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Text(
            maxLines: 1,
            text,
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
