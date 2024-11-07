import 'dart:io';

void main() {
  // Menerima input panjang piramida dari user
  stdout.write('Masukkan panjang piramida: ');
  int? panjang = int.tryParse(stdin.readLineSync()!);

  if (panjang != null && panjang > 0) {
    for (int i = 1; i <= panjang; i++) {
      // Cetak spasi untuk mengatur posisi bintang
      stdout.write(' ' * (panjang - i));
      // Cetak bintang
      stdout.write('* ' * i);
      // Pindah ke baris berikutnya
      print('');
    }
  } else {
    print('Input tidak valid. Masukkan angka yang lebih besar dari 0.');
  }
}