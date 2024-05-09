import 'package:absher/user/view/ReportPage.dart';
import 'package:flutter/material.dart';

import 'user/view/widgets/suggestion_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen();

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [],
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 35),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      itemCount: 3,
                      itemBuilder: (_, index) {
                        return UnconstrainedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SuggestionBox(
                              onTap: () async {
                                _nav(message: 'test');
                              },
                              text: 'test',
                              isture: false,
                            ),
                          ),
                        );
                      },
                    ),
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
