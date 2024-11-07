// Fungsi untuk Membuat Matriks dan Matriks Transpose

import 'dart:math';

void createMatrix(int a, int b) {
  // Membuat matriks dengan random value
  List<List<int>> matrix = List.generate(a, (_) => List.generate(b, (_) => Random().nextInt(10) + 1));

  // Menampilkan matriks
  print("Matriks ${a}x${b}:");
  for (var row in matrix) {
    print(row.join(" "));
  }

  // Membuat matriks transpose
  List<List<int>> transpose = List.generate(b, (i) => List.generate(a, (j) => matrix[j][i]));

  // Menampilkan matriks transpose
  print("\nHasil transpose:");
  for (var row in transpose) {
    print(row.join(" "));
  }
}

void main() {
  createMatrix(3, 2);
}
