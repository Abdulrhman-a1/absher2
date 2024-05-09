import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/imge.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // UI Elements on top
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                height: 647,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                padding: EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            ' إلغاء',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ),
                        Text(
                          'تتبع البلاغ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      ':الموقع',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 132,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/imge4.png',
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                              top: 10,
                              right: 100,
                              child: Icon(
                                Icons.pin_drop_outlined,
                                color: Colors.lightGreen,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ' شارع أسير بن مالك، الرياض،الدوحة 7121، السعودية. ',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ':الجهة المعنية',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),

                    // -----  Ai output
                    Text(
                      ' الأمن العام',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ': ملخص البلاغ',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),

                    // -----   Ai output
                    Text(
                      message,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ': مرفقات',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),

                    // -----  Ai output
                    Text(
                      'لا يوجد مرفقات.',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      ': موعد الجلسة',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),

                    //-----   Ai output
                    Text(
                      'الثلاثاء ، الثامن عشر من أبريل لعام 2024',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF71D286),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Text('تأكيد',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
