import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:absher/Chatpage.dart';
import 'package:absher/connect_gpt.dart';
import 'package:absher/user/view/widgets/complain_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'user/view/widgets/attachments.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Absher',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MainScreen(),
      locale: Locale('ar'),
      routes: {
        '/home': (context) => MainScreen(),
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isLoading = false;
  final TextEditingController _cont = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/imge.jpg',
              fit: BoxFit.fill,
            )),
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
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ComplainArea(formKey: _key, controller: _cont),
                SizedBox(height: 16),
                Attachments(),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    if (_key.currentState!.validate()) {}
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
