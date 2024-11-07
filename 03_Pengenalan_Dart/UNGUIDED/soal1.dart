import 'dart:io';

String cekNilai(int nilai) {
  if (nilai > 70) {
    return 'Nilai A';
  } else if (nilai > 40 && nilai <= 70) {
    return 'Nilai B';
  } else if (nilai > 0 && nilai <= 40) {
    return 'Nilai C';
  } else {
    return ''; // Teks kosong
  }
}

void main() {
  // Menerima input nilai dari user
  stdout.write('Masukkan nilai: ');
  int? nilai = int.tryParse(stdin.readLineSync()!);

  if (nilai != null) {
    // Memanggil fungsi cekNilai dan mencetak hasilnya
    String hasil = cekNilai(nilai);
    if (hasil.isNotEmpty) {
      print('$nilai merupakan $hasil');
    } else {
      print('Nilai tidak valid.');
    }
  } else {
    print('Input tidak valid.');
  }
}