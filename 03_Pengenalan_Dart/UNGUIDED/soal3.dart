import 'dart:io';

bool cekPrima(int angka) {
  if (angka <= 1) {
    return false; // Bilangan kurang dari atau sama dengan 1 bukan bilangan prima
  }
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false; // Jika ada pembagi selain 1 dan angka itu sendiri
    }
  }
  return true; // Jika tidak ditemukan pembagi, bilangan tersebut prima
}

void main() {
  // Menerima input bilangan dari user
  stdout.write('Masukkan sebuah bilangan bulat: ');
  int? angka = int.tryParse(stdin.readLineSync()!);

  if (angka != null) {
    if (cekPrima(angka)) {
      print('$angka adalah bilangan prima');
    } else {
      print('$angka bukan bilangan prima');
    }
  } else {
    print('Input tidak valid.');
  }
}