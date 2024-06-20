import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/app/app.dart';
import 'package:hive_example/data/adapters/notes_adapter.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';
import 'package:path_provider/path_provider.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox<NotesModel>("notes");

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
