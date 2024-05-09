import 'package:flutter/material.dart';

class MessageFormAi extends StatelessWidget {
  const MessageFormAi({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Colors.grey.withOpacity(0.4)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
