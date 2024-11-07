// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Jelajah Wisata',
//       home: pageWisataBanyumas(),
//     );
//   }
// }

// class pageWisataBanyumas extends StatelessWidget {
//   // Daftar rekomendasi tempat wisata
//   final List<Map<String, dynamic>> Wisata = [
//     {
//       'nama': 'Pantai Nusakambangan',
//       'deskripsi':
//           'Pantai ini menawarkan pemandangan alam yang eksotis dan air laut yang jernih.',
//       'gambar':
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl2Kmtgm07TMtnPJTHt3k1DTZdGtjL4LknjQ&s',
//       'warna': const Color.fromARGB(255, 173, 216, 230), // Warna biru muda
//     },
//     {
//       'nama': 'Baturraden',
//       'deskripsi':
//           'Baturraden terkenal dengan keindahan alam pegunungan dan udara segar.',
//       'gambar':
//           'https://awsimages.detik.net.id/community/media/visual/2023/09/05/lokawisata-baturraden-1.jpeg?w=800',
//       'warna': const Color.fromARGB(255, 135, 206, 250), // Warna biru langit
//     },
//     {
//       'nama': 'Curug Cipendok',
//       'deskripsi':
//           'Curug Cipendok adalah air terjun tinggi dengan panorama alam yang memukau.',
//       'gambar':
//           'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/867/2024/01/15/1-742884947.png',
//       'warna': const Color.fromARGB(255, 100, 149, 237), // Warna biru cornflower
//     },
//     {
//       'nama': 'Taman Andhang Pangrenan',
//       'deskripsi':
//           'Taman kota ini cocok untuk bersantai dan menikmati suasana asri.',
//       'gambar':
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_lUsfskujOV4lbt1Bn51p1eWP3faXUkv3Mg&s',
//       'warna': const Color.fromARGB(255, 70, 130, 180), // Warna biru steel
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'Jelajah Wisata',
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 30, 144, 255), // Warna biru DodgerBlue
//       ),

//       // Widget CustomScrollView
//       body: CustomScrollView(
//         slivers: [
//           // Sliver AppBar
//           SliverAppBar(
//             expandedHeight: 80,
//             pinned: true,
//             backgroundColor: Colors.white,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(
//                 "Rekomendasi Wisata",
//                 style: TextStyle(
//                   fontSize: 22,
//                   color: const Color.fromRGBO(0, 51, 153, 1), // Warna biru tua
//                 ),
//               ),
//             ),
//           ),

//           // Sliver List
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return Card(
//                   color: Wisata[index]['warna'], // Warna biru untuk setiap item
//                   elevation: 5,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15), // Menambahkan border radius
//                   ),
//                   margin: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(15),
//                           topRight: Radius.circular(15),
//                         ),
//                         child: Image.network(
//                           Wisata[index]['gambar']!,
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               Wisata[index]['nama']!,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white, // Teks warna putih
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               Wisata[index]['deskripsi']!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Colors.black87, // Teks deskripsi berwarna hitam
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Aksi ketika tombol diklik
//                         },
//                         child: const Text(
//                           'Kunjungi Sekarang',
//                           style: TextStyle(color: Colors.white), // Teks tombol putih
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color.fromARGB(255, 30, 144, 255), // Warna tombol biru
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30), // Membuat tombol rounded
//                           ),
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 20,
//                           ),
//                           elevation: 5, // Menambahkan shadow pada tombol
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                     ],
//                   ),
//                 );
//               },
//               childCount: Wisata.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
