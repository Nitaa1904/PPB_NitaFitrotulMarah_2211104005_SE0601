// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter ListView with Dialog',
//       theme: ThemeData(),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // List item sederhana tanpa penggunaan Map yang berlebihan
//   final List<Map<String, String>> items = [
//     {'name': 'Native App', 'detail': 'Android, iOS\n\n Java, Kotlin, Swift'},
//     {'name': 'Hybrid App', 'detail': 'Android, iOS, Web\n\n JavaScript, Dart'},
//   ];

//   // Fungsi untuk menampilkan dialog detail item
//   void showItemDetail(BuildContext context, String name, String detail) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(name),
//           content: Text(detail),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter ListView with Dialog'),
//       ),
//       body: ListView.separated(
//         itemCount: items.length,
//         separatorBuilder: (_, __) => const Divider(),
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundColor: index == 0 ? Colors.orange : Colors.grey,
//             ),
//             title: Text(item['name']!),
//             onTap: () =>
//                 showItemDetail(context, item['name']!, item['detail']!),
//           );
//         },
//       ),
//     );
//   }
// }