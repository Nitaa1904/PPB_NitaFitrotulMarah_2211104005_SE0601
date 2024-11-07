// import 'package:flutter/material.dart';
// import 'package:guided/model/product.dart';
// import 'package:guided/pages/detail.dart';

// class Mypage extends StatelessWidget {
//   Mypage({super.key});

//   final List<Product> products = [
//     Product(
//         id: 1,
//         nama: 'Mouse',
//         harga: 280000.00,
//         imageUrl:
//             'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
//         deskripsi: 'High-quality gaming mouse with customizable buttons.'),
//     Product(
//         id: 2,
//         nama: 'Keyboard',
//         harga: 400000.00,
//         imageUrl:
//             'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1',
//         deskripsi: 'Mechanical keyboard perfect for both typing and gaming.'),
//     Product(
//         id: 3,
//         nama: 'Headphone',
//         harga: 200000.00,
//         imageUrl:
//             'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
//         deskripsi: 'Affordable headphones with good sound quality.'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Catalog'),
//         centerTitle: true,
//         backgroundColor: Colors.blue[300],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: ListTile(
//               leading: Image.network(
//                 product.imageUrl,
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//               title: Text(product.nama),
//               subtitle: Text('Rp ${product.harga.toStringAsFixed(0)}'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => DetailProduct(
//                       name: product.nama,
//                       price: product.harga,
//                       imageUrl: product.imageUrl,
//                       description: product.deskripsi,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }