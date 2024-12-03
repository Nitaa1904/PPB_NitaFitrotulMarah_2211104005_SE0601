// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // Definisikan channel notifikasi
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // ID Channel
//   'High Importance Notifications', // Nama Channel
//   description: 'This channel is used for important notifications.', // Deskripsi
//   importance: Importance.high, // Prioritas
// );

// // Plugin notifikasi lokal
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message: ${message.messageId}');
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   // Konfigurasi pesan latar belakang
//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

//   // Konfigurasi channel notifikasi
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   // Konfigurasi tampilan notifikasi saat aplikasi berjalan
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyNotificationScreen(),
//     );
//   }
// }

// class MyNotificationScreen extends StatefulWidget {
//   const MyNotificationScreen({super.key});

//   @override
//   State<MyNotificationScreen> createState() => _MyNotificationScreenState();
// }

// class _MyNotificationScreenState extends State<MyNotificationScreen> {
//   String? _token;

//   @override
//   void initState() {
//     super.initState();
//     _initializeFirebaseMessaging();
//   }

//   Future<void> _initializeFirebaseMessaging() async {
//     // Ambil token untuk notifikasi
//     _token = await FirebaseMessaging.instance.getToken();
//     print('FCM Token: $_token');

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Received a foreground message: ${message.notification?.title}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//       ),
//       body: Center(
//         child: const Text(
//           'This is the Notification Screen',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }
