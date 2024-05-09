import 'package:flutter/material.dart';

class Attachments extends StatelessWidget {
  const Attachments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(color: Colors.white, shape: StadiumBorder()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              color: Colors.black54,
              onPressed: () {},
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.mic),
              color: Colors.black54,
              onPressed: () {},
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.image),
              color: Colors.black54,
              onPressed: () {},
            ),
            SizedBox(width: 60),
            Text(
              "المرفقات",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
