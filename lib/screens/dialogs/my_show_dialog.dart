import 'package:flutter/material.dart';
import 'package:hive_example/screens/widget/alert_view.dart';

myShowDialog(
    {required VoidCallback onTabSave,
    required BuildContext context,
    String title = "Do you want to save the information?"}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertView(
        onTabSave: onTabSave,
        onTabDiscard: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        title: title,
      );
    },
  );
}
