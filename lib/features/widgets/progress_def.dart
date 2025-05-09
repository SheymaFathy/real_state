import 'package:flutter/material.dart';

Future<void> showProgressDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20.0),
              Text("جارٍ التحميل..."),
            ],
          ),
        ),
      );
    },
  );
}
