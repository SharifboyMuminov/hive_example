import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';

class NotesAdapter extends TypeAdapter<NotesModel> {
  @override
  final int typeId = 0;

  @override
  NotesModel read(BinaryReader reader) {
    final String fullName = reader.read() as String? ?? "";
    final String text = reader.read() as String? ?? "";
    final String createDate = reader.read() as String? ?? "";
    final Color color = Color(
      reader.readUint32() as int? ?? (Colors.blue.value),
    );

    return NotesModel(
      color: color,
      fullName: fullName,
      text: text,
      createDate: createDate,
    );
  }

  @override
  void write(BinaryWriter writer, NotesModel obj) {
    writer.write(obj.fullName);
    writer.write(obj.text);
    writer.write(obj.createDate);
    writer.writeUint32(obj.color.value);
  }
}
