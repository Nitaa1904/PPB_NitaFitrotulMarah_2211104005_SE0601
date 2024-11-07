void main() {
  List<Map<String, dynamic>> daftarMahasiswa = [
    {
      "nama": "John Doe",
      "ipk": 3.88,
      "isMarried": false,
    },
    {
      "nama": "Andi Doe",
      "ipk": 3.78,
      "isMarried": true,
    },
    {
      "nama": "Budi Doe",
      "ipk": 3.68,
      "isMarried": true,
    }
  ];

  // 1.a Menghitung rerata IPK
  double totalIpk = 0;
  daftarMahasiswa.forEach((mahasiswa) {
    totalIpk += mahasiswa['ipk'];
  });
  double rerataIpk = totalIpk / daftarMahasiswa.length;
  print('Rerata IPK: $rerataIpk');

  // 1.b Menghitung jumlah mahasiswa yang sudah menikah
  int jumlahMenikah = 0;
  daftarMahasiswa.forEach((mahasiswa) {
    if (mahasiswa['isMarried']) {
      jumlahMenikah++;
    }
  });
  print('Jumlah mahasiswa yang sudah menikah: $jumlahMenikah');
}
