import 'package:equatable/equatable.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';

abstract class NotesEvent extends Equatable {}

class NotesDeleteEvent extends NotesEvent {
  final NotesModel notesModel;

  NotesDeleteEvent({required this.notesModel});

  @override
  List<Object?> get props => [notesModel];
}

class NotesInsertEvent extends NotesEvent {
  final NotesModel noteModel;

  NotesInsertEvent({required this.noteModel});

  @override
  List<Object?> get props => [noteModel];
}

class NotesCallEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}

class NotesUpdateEvent extends NotesEvent {
  final NotesModel newNotesModel;
  final NotesModel confirmNotesModel;

  NotesUpdateEvent({
    required this.confirmNotesModel,
    required this.newNotesModel,
  });

  @override
  List<Object?> get props => [confirmNotesModel, newNotesModel];
}

class NotesSearchEvent extends NotesEvent {
  final String title;

  NotesSearchEvent({required this.title});

  @override
  List<Object?> get props => [title];
}
