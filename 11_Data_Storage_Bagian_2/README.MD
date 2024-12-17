# Laporan 11 Data Storage Bagian 2 - Firebase Notifications dengan Flutter

## Deskripsi Proyek

Pada bagian ini, kita akan mengintegrasikan Firebase Cloud Messaging (FCM) dengan aplikasi Flutter untuk menerima notifikasi push dan menampilkan notifikasi lokal. Aplikasi ini menerima pesan latar belakang dan pesan saat aplikasi aktif menggunakan Firebase Messaging, serta menampilkan notifikasi lokal menggunakan plugin `flutter_local_notifications`.

## Fitur

- Menggunakan **Firebase Cloud Messaging (FCM)** untuk mengirim dan menerima notifikasi push.
- Menampilkan notifikasi lokal menggunakan plugin `flutter_local_notifications`.
- Mengonfigurasi channel notifikasi untuk Android.
- Menampilkan notifikasi ketika aplikasi berjalan di latar depan.
- Menangani aksi ketika notifikasi dibuka oleh pengguna.

## Persyaratan

- Flutter SDK versi 3.x atau yang lebih baru.
- Firebase project dan Firebase Cloud Messaging.
- Plugin `firebase_messaging` dan `flutter_local_notifications` di `pubspec.yaml`.

## Langkah-langkah Implementasi

### 1. Instalasi Plugin

Untuk menggunakan Firebase Messaging dan Local Notifications, pastikan untuk menambahkan dependencies berikut di `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.15.0
  firebase_messaging: ^14.5.0
  flutter_local_notifications: ^15.0.0
```

### 2. Konfigurasi Firebase

Sebelum mengembangkan lebih lanjut, pastikan Firebase sudah dikonfigurasi dalam proyek Flutter. Untuk melakukannya, ikuti [panduan Firebase untuk Flutter](https://firebase.flutter.dev/docs/overview).

### 3. Menyiapkan Firebase Cloud Messaging

Kode berikut menunjukkan bagaimana cara mengonfigurasi Firebase Messaging untuk aplikasi yang menerima notifikasi:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Definisikan channel notifikasi untuk Android
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // ID Channel
  'High Importance Notifications', // Nama Channel
  description: 'This channel is used for important notifications.', // Deskripsi
  importance: Importance.high, // Prioritas
);

// Plugin notifikasi lokal
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Konfigurasi pesan latar belakang
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Konfigurasi channel notifikasi
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // Konfigurasi tampilan notifikasi saat aplikasi berjalan
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyNotificationScreen(),
    );
  }
}
```

### 4. Menangani Pesan dan Menampilkan Notifikasi

Pada bagian ini, kita akan mendengarkan pesan yang diterima ketika aplikasi berjalan di latar depan dan menampilkan notifikasi lokal. Jika aplikasi dalam keadaan latar belakang dan notifikasi diterima, maka notifikasi akan ditampilkan menggunakan channel yang sudah dibuat.

```dart
class MyNotificationScreen extends StatefulWidget {
  const MyNotificationScreen({super.key});

  @override
  State<MyNotificationScreen> createState() => _MyNotificationScreenState();
}

class _MyNotificationScreenState extends State<MyNotificationScreen> {
  String? _token;

  @override
  void initState() {
    super.initState();
    _initializeFirebaseMessaging();
  }

  Future<void> _initializeFirebaseMessaging() async {
    // Ambil token untuk notifikasi
    _token = await FirebaseMessaging.instance.getToken();
    print('FCM Token: $_token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a foreground message: ${message.notification?.title}');

      // Tampilkan notifikasi lokal saat aplikasi aktif
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode, // ID notifikasi (unik)
          notification.title, // Judul notifikasi
          notification.body, // Isi notifikasi
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              icon: '@mipmap/ic_launcher',
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: Center(
        child: const Text(
          'This is the Notification Screen',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
```

### 5. Mendapatkan Token FCM

Token perangkat digunakan untuk mengidentifikasi perangkat yang menerima notifikasi. Token dapat diperoleh melalui:

```dart
void getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token'); // Menampilkan token di log
}
```

### Output

Ketika aplikasi berhasil menerima notifikasi push, dan aplikasi berjalan di latar depan, notifikasi akan ditampilkan sebagai berikut:

- Judul dan isi pesan akan ditampilkan dalam bentuk notifikasi lokal di perangkat.
- Jika pengguna membuka notifikasi, aplikasi akan menampilkan dialog berisi judul dan isi pesan.

Jika aplikasi berjalan di latar belakang atau ditutup, pesan akan diterima sebagai pesan latar belakang dan ditangani sesuai dengan konfigurasi yang ada.

### Hasil Tampilan

Setelah aplikasi diimplementasikan, berikut adalah contoh tampilan notifikasi yang diterima oleh aplikasi:

1. **Notifikasi di layar utama aplikasi**:
   Judul dan isi pesan notifikasi muncul dalam bentuk pop-up.
   <img src="unguided/WhatsApp Image 2024-12-03 at 16.27.02.jpeg" 
       alt="WhatsApp Image 1" 
       style="width: 200px; height: auto;">
2. **Dialog ketika notifikasi dibuka**:
   Sebuah dialog akan muncul dengan informasi lengkap dari pesan notifikasi.
   <img src="unguided/WhatsApp Image 2024-12-03 at 16.36.18 (1).jpeg" 
          alt="WhatsApp Image 2" 
          style="width: 200px; height: auto;">

## Kesimpulan

Proyek ini telah berhasil mengintegrasikan **Firebase Cloud Messaging** untuk mengirim dan menerima notifikasi push, serta menggunakan **flutter_local_notifications** untuk menampilkan notifikasi lokal. Dengan mengonfigurasi channel notifikasi dan menangani pesan latar depan dan latar belakang, aplikasi dapat memberikan pengalaman interaktif bagi pengguna.
