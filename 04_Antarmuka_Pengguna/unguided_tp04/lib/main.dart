import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WisataBanyumasPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class WisataBanyumasPage extends StatelessWidget {
  // Daftar wisata dalam bentuk list
  final List<Wisata> wisataList = [
    Wisata(
      name: 'Pantai Nusakambangan',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl2Kmtgm07TMtnPJTHt3k1DTZdGtjL4LknjQ&s',
      description: 'Pantai ini menawarkan pemandangan alam yang eksotis dan air laut yang jernih.',
    ),
    Wisata(
      name: 'Baturraden',
      imageUrl: 'https://awsimages.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1.jpeg?w=800',
      description: 'Baturraden terkenal dengan keindahan alam pegunungan dan udara segar.',
    ),
    Wisata(
      name: 'Curug Cipendok',
      imageUrl: 'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/867/2024/01/15/1-742884947.png',
      description: 'Curug Cipendok adalah air terjun tinggi dengan panorama alam yang memukau.',
    ),
    Wisata(
      name: 'Taman Andhang Pangrenan',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_lUsfskujOV4lbt1Bn51p1eWP3faXUkv3Mg&s',
      description: 'Taman kota ini cocok untuk bersantai dan menikmati suasana asri.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Banyumas', style: TextStyle(fontSize: 20)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: wisataList.length,
        itemBuilder: (context, index) {
          final wisata = wisataList[index];
          return Center(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                width: 250, // Menentukan lebar dan tinggi card agar berbentuk persegi
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        wisata.imageUrl,
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            wisata.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            wisata.description,
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              // Fungsi aksi ketika tombol diklik
                              print('${wisata.name} dikunjungi');
                            },
                            child: Text('Kunjungi'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              minimumSize: Size(100, 40), // Ukuran tombol yang lebih proporsional
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
