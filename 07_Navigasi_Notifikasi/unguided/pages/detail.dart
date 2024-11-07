// import 'package:flutter/material.dart';

// class DetailProduct extends StatelessWidget {
//   final String name;
//   final double price;
//   final String imageUrl;
//   final String description;

//   const DetailProduct({
//     super.key,
//     required this.name,
//     required this.price,
//     required this.imageUrl,
//     required this.description,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Detail'),
//         backgroundColor: Colors.blue[300],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Image.network(
//                 imageUrl,
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               name,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Price: Rp ${price.toStringAsFixed(0)}',
//               style: const TextStyle(fontSize: 20, color: Colors.green),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               description,
//               style: const TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }