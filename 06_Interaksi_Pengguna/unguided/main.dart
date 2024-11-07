// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     HomeFormPage(), // Form page for Home
//     Center(child: Text('Ini adalah halaman Wisata')),
//     Center(child: Text('Ini adalah halaman Profil')),
//   ];

//   final List<String> _titles = [
//     'Home',
//     'Wisata',
//     'Profil',
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _titles[_selectedIndex],
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 0, 102, 204), // New AppBar color
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.place),
//             label: 'Wisata',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profil',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: const Color.fromARGB(255, 0, 153, 255), // New selected item color
//         unselectedItemColor: const Color.fromARGB(255, 204, 229, 255), // New unselected item color
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class HomeFormPage extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Align(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SizedBox(
//               width: 400, // Set the form width
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Masukkan Nama',
//                         prefixIcon: Icon(Icons.account_circle_outlined),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Nama tidak boleh kosong';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 8.0),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Masukkan Email',
//                         prefixIcon: Icon(Icons.email_outlined),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Email tidak boleh kosong';
//                         } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                             .hasMatch(value)) {
//                           return 'Masukkan email yang valid';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 25),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Data submitted!')),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromARGB(255, 0, 128, 255), // New button color
//                         foregroundColor: Colors.white, // New text color on button
//                       ),
//                       child: Text('Submit'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
