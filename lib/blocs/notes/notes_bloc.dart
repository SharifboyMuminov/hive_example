import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/blocs/notes/notes_event.dart';
import 'package:hive_example/blocs/notes/notes_state.dart';
import 'package:hive_example/data/models/from_status/from_status.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc()
      : super(
          const NotesState(
            allNotes: [],
            currentNotes: [],
            fromStatus: FromStatus.pure,
            errorText: "",
            statusMessage: "",
          ),
        ) {
    on<NotesCallEvent>(_callNoteData);
    on<NotesDeleteEvent>(_deleteNote);
    on<NotesInsertEvent>(_insertNote);
    on<NotesUpdateEvent>(_updateNote);
    on<NotesSearchEvent>(_searchNote);
    hi = Hive.box("notes");
  }

  late final Box hi;

  Future<void> _callNoteData(
      NotesCallEvent notesCallEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }

  Future<void> _deleteNote(
      NotesDeleteEvent notesDeleteEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }

  Future<void> _insertNote(
      NotesInsertEvent notesInsertEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }

  Future<void> _updateNote(
      NotesUpdateEvent notesUpdateEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
  }

  Future<void> _searchNote(
      NotesSearchEvent notesSearchEvent, Emitter<NotesState> emit) async {}
}
