import 'dart:ui';

import 'package:absher/Chatpage.dart';
import 'package:absher/connect_gpt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MainScreen(),
      locale: Locale('ar'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _cont = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/imge.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'كلنا أمن',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 29),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle menu button if necessary
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 128,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 16),
                      child: Form(
                        key: _key,
                        child: TextFormField(
                          controller: _cont,
                          validator: (value) => value == null ? "" : null,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              hintText:
                                  ' تفاصيل \n اكتب وصف البلاغ الخاص بك هنا',
                              border: InputBorder.none),
                          minLines: 3,
                          maxLines: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                      color: Colors.white, shape: StadiumBorder()),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 25),
                            Icon(
                              Icons.mic,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 25),
                            Icon(
                              Icons.image,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 60),
                            Text(
                              "المرفقات",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_key.currentState!.validate()) {
                      String query = _cont.text;
                      Connect _connect = Connect();
                      String gpt = await _connect.trigger(query: query);
                      setState(() {
                        isLoading = false;
                        _cont.text = '';
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(message: gpt)),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF71D286),
                    minimumSize: Size(double.infinity, 60), // Width and height
                  ),
                  child: Text(
                    'إرسال',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isLoading)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Center(
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  color: Colors.green[200],
                  strokeWidth: 5,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ),
          )
      ],
    );
  }
}
