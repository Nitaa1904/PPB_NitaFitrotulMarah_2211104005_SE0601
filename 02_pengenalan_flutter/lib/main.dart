import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Biodata',
      debugShowCheckedModeBanner: false, // Menghilangkan garis kuning debug
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Warna krem terang
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 26, // Mengatur ukuran font
            fontWeight: FontWeight.w600, // Tebal font
            color: Colors.white, // Warna putih untuk judul
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Warna biru aksen
        elevation: 4, // Sedikit bayangan untuk kesan mendalam
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                    '/lib/nita.jpg'), // Ganti dengan path image lokal
                backgroundColor: Colors.blue[100], // Latar belakang avatar biru muda
              ),
              const SizedBox(height: 20),
              const Text(
                "Nita Fitrotul Mar'ah",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent, // Ubah warna teks menjadi biru aksen
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Mahasiswa S1 Software Engineering',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54, // Warna lebih lembut
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Universitas Telkom, Purwokerto',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                thickness: 2,
                indent: 50,
                endIndent: 50,
                color: Colors.blueAccent, // Divider warna biru
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue[50], // Latar belakang biru lembut
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26, // Bayangan hitam lembut
                      blurRadius: 10.0,
                      offset: const Offset(4.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Tentang Saya:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent, // Warna biru
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Saya seorang mahasiswa yang bersemangat di bidang teknologi. Dengan minat mendalam pada pengembangan perangkat lunak, saya selalu mencari cara untuk terus belajar dan meningkatkan keterampilan di bidang programming. Saat ini, saya berada di semester 5 dan mempelajari berbagai topik terkait pengembangan aplikasi full-stack.',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Awalnya, saya tidak suka ngoding. Saya masuk prodi ini karena ya, namanya menarik. Saya masuk tanpa tahu apa pun tentang Software Engineering. Tetapi, mau tidak mau, saya sudah terlanjur di sini, jadi mari berjuang sampai akhir!',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Spacer
              const Text(
                'You have clicked the button this many times:',
                style: TextStyle(color: Colors.black87),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.blueAccent, // Ubah warna counter menjadi biru
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.blueAccent, // Warna biru sesuai tema
        child: const Icon(Icons.add),
      ),
    );
  }
}
