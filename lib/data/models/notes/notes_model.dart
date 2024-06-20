import 'package:flutter/material.dart';

class NotesModel {
  int? id;
  String fullName;
  String text;
  String createDate;
  Color color;
  bool isRemove;

  NotesModel({
    required this.color,
    required this.fullName,
    required this.text,
    required this.createDate,
    this.isRemove = false,
    this.id,
  });

  static NotesModel defaultModel() {
    return NotesModel(
      fullName: "",
      text: "",
      createDate: "",
      color: Colors.white10,
    );
  }

  NotesModel copyWith({
    String? date,
    String? fullName,
    int? id,
    String? createDate,
    String? text,
    Color? color,
  }) {
    return NotesModel(
      color: color ?? this.color,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      text: text ?? this.text,
      createDate: createDate ?? this.createDate,
    );
  }
}
