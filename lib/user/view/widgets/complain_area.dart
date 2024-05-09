import 'package:flutter/material.dart';

class ComplainArea extends StatelessWidget {
  const ComplainArea({
    super.key,
    required this.formKey,
    required this.controller,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              validator: (value) => value == null ? "" : null,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  hintText: ' تفاصيل \n اكتب وصف البلاغ الخاص بك هنا',
                  border: InputBorder.none),
              minLines: 3,
              maxLines: 5,
            ),
          ),
        ),
      ),
    );
  }
}
