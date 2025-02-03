import 'package:godeeper/models/note.dart';
import 'package:godeeper/services/abstract/base_service.dart';

class NoteService extends BaseService {

  ///
  /// Get a random note from a specified day
  ///
  Note getANote(DateTime date) => Note.fromMap(Note.testData[0]);

  ///
  ///Get a specific note by id
  Note getNote(String id) => Note.fromMap(Note.testData[0]);

  Note putANote(Note putNote) => Note.fromMap(putNote.toMap());
  Note updateNote(Note putNote) => Note.fromMap(putNote.toMap());

  bool deleteNote(String id) => false;

}
