// void main() {
//   int namaMahasiswa = 10;
//   print(namaMahasiswa);

  

//   // var dynamic

//   var nama = "Nita";
//   dynamic alamat = "Jl. Jendral Sudirman";

//   print(nama);
//   print(alamat);
// }


// void main() {
//   List<dynamic> daftarMahasiswa = ["Nita", "Marah", 2, false, ["game", "coding"]];
//   print(daftarMahasiswa[4][1]);
// }

void main() {
  List<double> ipkValues = [3.9, 3.88, 3.77, 4.00, 3.55];

  double sum = 0;
  for (int i = 0; i < ipkValues.length; i++) {
    sum += ipkValues[i];
  }

  double averageIpk = sum / ipkValues.length;
  print('Rata-rata IPK: $averageIpk');
}

