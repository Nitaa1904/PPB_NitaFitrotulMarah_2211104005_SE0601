// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // Pastikan channel dan plugin didefinisikan di luar kelas
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // ID Channel
//   'High Importance Notifications', // Nama Channel
//   description: 'This channel is used for important notifications.',
//   importance: Importance.high, // Prioritas Tinggi
// );

// class MyNotificationScreen extends StatefulWidget {
//   const MyNotificationScreen({super.key});

//   @override
//   State<MyNotificationScreen> createState() => _MyNotificationScreenState();
// }

// class _MyNotificationScreenState extends State<MyNotificationScreen> {
//   @override
//   void initState() {
//     super.initState();

//     // Membuat pengaturan inisialisasi notifikasi untuk Android
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Mendengarkan pesan saat aplikasi aktif
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;

//       // Jika notifikasi tersedia, tampilkan menggunakan notifikasi lokal
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//           notification.hashCode, // ID notifikasi (unik)
//           notification.title, // Judul notifikasi
//           notification.body, // Isi notifikasi
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id, // ID Channel
//               channel.name, // Nama Channel
//               channelDescription: channel.description, // Deskripsi Channel
//               color: Colors.blue, // Warna Notifikasi
//               icon: '@mipmap/ic_launcher', // Ikon aplikasi
//             ),
//           ),
//         );
//       }
//     });

//     // Menangani aksi ketika notifikasi dibuka
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       RemoteNotification? notification = message.notification;
//       AndroidNotification? android = message.notification?.android;

//       // Jika notifikasi tersedia, tampilkan dialog
//       if (notification != null && android != null) {
//         showDialog(
//           context: context,
//           builder: (_) {
//             return AlertDialog(
//               title: Text(notification.title ?? ""), // Judul dialog
//               content: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [Text(notification.body ?? "")], // Isi dialog
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     });

//     // Memanggil metode untuk mengambil token FCM perangkat
//     getToken();
//   }

//   // Metode untuk mendapatkan token FCM
//   void getToken() async {
//     String? token = await FirebaseMessaging.instance.getToken();
//     print('FCM Token: $token'); // Menampilkan token di log
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//         backgroundColor: Colors.amber, // Pisahkan properti dengan koma
//         centerTitle: true, // Tambahkan koma di sini juga
//       ),
//       body: const Center(
//         child: Text(
//           'This is the Notification Screen',
//           style:
//               TextStyle(fontSize: 18), // Tambahkan style untuk memperjelas teks
//         ),
//       ),
//     );
//   }
// }
