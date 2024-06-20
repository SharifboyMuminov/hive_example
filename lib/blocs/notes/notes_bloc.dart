import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/blocs/notes/notes_event.dart';
import 'package:hive_example/blocs/notes/notes_state.dart';
import 'package:hive_example/data/models/from_status/from_status.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';

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
    notesDataBase = Hive.box<NotesModel>("notes");
  }

  late final Box notesDataBase;

  Future<void> _callNoteData(
      NotesCallEvent notesCallEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    try {
      List<NotesModel> notesModels = notesDataBase.values.toList().cast();
      emit(
        state.copyWith(
            fromStatus: FromStatus.success,
            currentNotes: notesModels,
            allNotes: notesModels),
      );
    } catch (error) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: error.toString(),
        ),
      );
    }
  }

  Future<void> _deleteNote(
      NotesDeleteEvent notesDeleteEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    try {
      var key = notesDataBase.keyAt(notesDeleteEvent.index);

      notesDataBase.delete(key);
      add(NotesCallEvent());
    } catch (error) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: error.toString(),
        ),
      );
    }
  }

  Future<void> _insertNote(
      NotesInsertEvent notesInsertEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    try {
      notesDataBase.add(notesInsertEvent.noteModel);
      add(NotesCallEvent());
    } catch (error) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: error.toString(),
        ),
      );
    }
  }

  Future<void> _updateNote(
      NotesUpdateEvent notesUpdateEvent, Emitter<NotesState> emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));
    emit(state.copyWith(fromStatus: FromStatus.loading));

    try {
      notesDataBase.putAt(
        notesUpdateEvent.index,
        notesUpdateEvent.noteModel,
      );
      add(NotesCallEvent());
    } catch (error) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: error.toString(),
        ),
      );
    }
  }

  Future<void> _searchNote(
      NotesSearchEvent notesSearchEvent, Emitter<NotesState> emit) async {}
}
