import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NotesModel extends HiveObject {
  @HiveField(0)
  String fullName;
  @HiveField(0)
  String text;
  @HiveField(0)
  String createDate;
  @HiveField(1)
  Color color;

  NotesModel({
    required this.color,
    required this.fullName,
    required this.text,
    required this.createDate,
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
    String? fullName,
    String? createDate,
    String? text,
    Color? color,
  }) {
    return NotesModel(
      color: color ?? this.color,
      fullName: fullName ?? this.fullName,
      text: text ?? this.text,
      createDate: createDate ?? this.createDate,
    );
  }
}
