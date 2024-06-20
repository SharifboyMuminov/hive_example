import 'package:flutter/material.dart';
import 'package:hive_example/screens/widget/alert_view.dart';

showMyDialog({
  required VoidCallback onTabSave,
  required VoidCallback onTabExit,
  required BuildContext context,
  String title = "Do you want to save the information?",
  String titleSaveButton = "Save",
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertView(
        titleSaveButton: titleSaveButton,
        onTabSave: onTabSave,
        onTabDiscard: onTabExit,
        title: title,
      );
    },
  );
}
