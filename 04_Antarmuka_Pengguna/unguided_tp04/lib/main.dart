import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WisataBanyumasPage(),
    );
  }
}

class WisataBanyumasPage extends StatelessWidget {
  // Daftar wisata dalam bentuk list
  final List<Wisata> wisataList = [
    Wisata(
      name: 'Pantai Nusakambangan',
      imageUrl: 'https://cdn0-production-images-kly.akamaized.net/HL3hE9zaAQP1SO0bRZwgoAJDM1A=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/644703/original/nusakambangan%20pic.jpg',
      description: 'Pantai ini menawarkan pemandangan alam yang eksotis dan air laut yang jernih, cocok untuk petualang dan pecinta alam.',
    ),
    Wisata(
      name: 'Baturraden',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/e5/Baturraden_%28Jawa_Tengah%2C_Indonesia%29.jpg',
      description: 'Baturraden terkenal dengan keindahan alam pegunungan, udara segar, dan berbagai wahana rekreasi alam.',
    ),
    Wisata(
      name: 'Curug Cipendok',
      imageUrl: 'https://www.itrip.id/wp-content/uploads/2020/12/Curug-Cipendok-Banyumas.jpg',
      description: 'Curug Cipendok adalah air terjun yang memiliki ketinggian sekitar 92 meter dengan panorama alam yang memukau.',
    ),
    Wisata(
      name: 'Taman Andhang Pangrenan',
      imageUrl: 'https://www.galeriwisata.com/wp-content/uploads/2020/06/Taman-Andhang-Pangrenan.jpg',
      description: 'Taman kota ini menjadi tempat yang cocok untuk bersantai bersama keluarga dan menikmati suasana sore yang asri.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rekomendasi Wisata Banyumas',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF005DA3), // Warna biru laut
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(
                    wisata.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wisata.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        wisata.description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Fungsi aksi, bisa ditambahkan untuk navigasi atau detail lebih lanjut
                        },
                        child: Text(
                          'Kunjungi Sekarang',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF005DA3), // Warna biru laut
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Model untuk data wisata
class Wisata {
  final String name;
  final String imageUrl;
  final String description;

  Wisata({required this.name, required this.imageUrl, required this.description});
}
