import 'package:absher/page3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Message model
class Message {
  String text;
  bool isSentByMe;

  Message({required this.text, this.isSentByMe = false});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add(Message(text: text, isSentByMe: true));
        _controller.clear();
      });
      // Simulate receiving a response
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          messages.add(Message(text: "Received: $text", isSentByMe: false));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackingPage()),
                  ),
              icon: Icon(Icons.abc_outlined))
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
          Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: messages.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      final message = messages[messages.length - 1 - index];
                      return ListTile(
                        title: Align(
                          alignment: message.isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: message.isSentByMe
                                  ? Color(0xFF71D286)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(message.text),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
