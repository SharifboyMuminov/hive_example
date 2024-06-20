import 'package:equatable/equatable.dart';
import 'package:hive_example/data/models/from_status/from_status.dart';
import 'package:hive_example/data/models/notes/notes_model.dart';

class NotesState extends Equatable {
  final FromStatus fromStatus;
  final String errorText;
  final String statusMessage;
  final List<NotesModel> currentNotes;
  final List<NotesModel> allNotes;

  const NotesState({
    required this.allNotes,
    required this.currentNotes,
    required this.fromStatus,
    required this.errorText,
    required this.statusMessage,
  });

  NotesState copyWith({
    FromStatus? fromStatus,
    String? errorText,
    String? statusMessage,
    List<NotesModel>? currentNotes,
    List<NotesModel>? allNotes,
  }) {
    return NotesState(
      allNotes: allNotes ?? this.allNotes,
      currentNotes: currentNotes ?? this.currentNotes,
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
        allNotes,
        currentNotes,
      ];
}
