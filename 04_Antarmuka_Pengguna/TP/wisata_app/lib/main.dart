import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PantaiNusakambanganPage(),
    );
  }
}

class PantaiNusakambanganPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Rekomendasi Wisata',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF005DA3), // Warna biru laut
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Pantai Nusakambangan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://cdn0-production-images-kly.akamaized.net/HL3hE9zaAQP1SO0bRZwgoAJDM1A=/800x450/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/644703/original/nusakambangan%20pic.jpg',
              height: 200,
              width: 300,
              fit: BoxFit.cover, // untuk menyesuaikan gambar di dalam kotak
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Pantai Nusakambangan terletak di pulau yang terkenal sebagai pulau penjara di Indonesia. Selain sisi sejarah dan misteri yang melekat, pantai ini menawarkan pemandangan alam yang eksotis dan air laut yang jernih, membuatnya cocok untuk dijelajahi oleh para petualang dan pecinta alam.\n\nPantai ini sering dikunjungi untuk kegiatan seperti snorkeling, fotografi alam, dan menikmati sunset yang memukau.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fungsi masih kosong, bisa ditambahkan aksi seperti navigasi ke halaman lain atau membuka URL
              },
              child: Text(
                'Kunjungi Sekarang',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005DA3), // Warna biru laut
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
