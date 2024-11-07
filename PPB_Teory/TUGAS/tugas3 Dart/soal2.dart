// Fungsi untuk Mencari Nilai dalam List 2 Dimensi

void searchValueInList(int value) {
  // Membuat List 2 dimensi sesuai spesifikasi
  List<List<int>> list = [
    [5, 10, 15],
    [2, 4, 6, 8],
    [1, 4, 9, 16, 25],
    [3, 4, 5, 6, 7, 8],
  ];

  // Menampilkan isi List
  print("Isi List:");
  for (var row in list) {
    print(row.join(" "));
  }

  // Mencari nilai dalam List
  bool found = false;
  print("\nBilangan yang dicari: $value");
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i].length; j++) {
      if (list[i][j] == value) {
        print("$value berada di: baris ${i + 1} kolom ${j + 1}");
        found = true;
      }
    }
  }

  if (!found) {
    print("$value tidak ditemukan dalam list.");
  }
}

void main() {
  searchValueInList(2);
  searchValueInList(5);
}
