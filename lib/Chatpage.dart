import 'dart:developer';

import 'package:absher/ReportPage.dart';
import 'package:absher/connect_gpt.dart';
import 'package:absher/suggestions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.message});
  final String message;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Widget> aiResponses = [];
  @override
  Widget build(BuildContext context) {
    FormateResponse formater = FormateResponse(response: widget.message.trim());
    List<Suggestions> suggestions = formater.getSuggestions();
    String display = widget.message.trim();
    display = display.replaceAll(RegExp(r'\d+'), '');
    aiResponses.add(
      MessageFormAi(
        text: display,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          // IconButton(
          //     onPressed: () => Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => ReportScreen(message: ,)),
          //         ),
          //     icon: Icon(Icons.abc_outlined))
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "محلل كلنا أمن الذكي",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xFF71D286),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/img3.png',
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...aiResponses,
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: suggestions.length + 1,
                        itemBuilder: (_, index) {
                          return UnconstrainedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SuggestionBox(
                                onTap: () async {
                                  log("index: $index, length: ${suggestions.length}");
                                  // if (suggestions.length < index) {
                                  //   Connect _connect = Connect();
                                  //   String gpt =
                                  //       await _connect.trigger(query: display);
                                  //   setState(() {
                                  //     FormateResponse formater =
                                  //         FormateResponse(response: gpt.trim());
                                  //     suggestions = formater.getSuggestions();
                                  //     String msg = gpt.trim();
                                  //     msg = msg.replaceAll(RegExp(r'\d+'), '');
                                  //     aiResponses.add(
                                  //       MessageFormAi(
                                  //         text: msg,
                                  //       ),
                                  //     );
                                  //   });
                                  //   return;
                                  // }
                                  _nav(
                                    message: formater.suggestionTitle(
                                        suggestion: suggestions[index]),
                                  );
                                },
                                text: suggestions.length > index
                                    ? formater.suggestionTitle(
                                        suggestion: suggestions[index])
                                    : "غير ذلك",
                                isture: false,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _nav({required String message}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ReportScreen(
          message: message,
        ),
      ),
    );
  }
}

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
      onTap: onTap,
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
          )),
    );
  }
}
