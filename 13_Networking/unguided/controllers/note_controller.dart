import 'package:get/get.dart';

class NoteController extends GetxController {
  // Daftar catatan
  var notes = <Map<String, String>>[].obs;

  // Menambah catatan baru
  void addNote(String title, String description) {
    notes.add({'title': title, 'description': description});
  }

  // Menghapus catatan
  void removeNoteAt(int index) {
    notes.removeAt(index);
  }
}
