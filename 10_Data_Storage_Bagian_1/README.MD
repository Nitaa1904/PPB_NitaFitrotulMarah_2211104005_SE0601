# Penyimpanan Data dengan SQLite pada Flutter

Dokumentasi ini memberikan penjelasan tentang cara menggunakan SQLite untuk menyimpan data dalam aplikasi Flutter. Aplikasi ini mengelola data mahasiswa seperti nama, NIM, alamat, dan hobi menggunakan database lokal SQLite. Berikut adalah penjelasan tentang struktur dan implementasi aplikasi.

### Komponen Utama

1. **DatabaseHelper**

   - `DatabaseHelper` adalah kelas yang mengatur semua interaksi dengan database SQLite. Dalam kelas ini, kita mendefinisikan beberapa fungsi penting, seperti membuka database, membuat tabel, menambah data, memperbarui data, menghapus data, dan mengambil data.

   - **Fungsi Utama:**

     - `insert`: Menambahkan data mahasiswa ke tabel `mahasiswa`.
     - `queryAllRows`: Mengambil semua data mahasiswa dari tabel.
     - `update`: Memperbarui data mahasiswa berdasarkan `id`.
     - `delete`: Menghapus data mahasiswa berdasarkan `id`.

   - **Inisialisasi Database**:
     - Database disimpan dalam file `.db` yang diletakkan di path yang disediakan oleh sistem. Fungsi `_initDatabase` memastikan database akan dibuat jika belum ada, dan tabel `mahasiswa` akan diinisialisasi dengan kolom yang diperlukan.

2. **AddMahasiswaView**

   - View ini digunakan untuk membuat tampilan form input data mahasiswa. Pengguna dapat memasukkan nama, NIM, alamat, dan hobi mahasiswa. Setelah form diisi, data akan disimpan ke dalam database menggunakan fungsi `insert` dari `DatabaseHelper`.

   - **Penggunaan `TextEditingController`**:
     - Setiap kolom input (nama, NIM, alamat, hobi) menggunakan `TextEditingController` untuk mengambil nilai dari form inputan dan menyimpannya ke dalam database saat tombol simpan ditekan.

3. **MainView**

   - Pada tampilan utama, aplikasi menampilkan daftar mahasiswa yang telah ditambahkan ke database dalam bentuk list. Setiap item dalam daftar menampilkan nama, NIM, alamat, dan hobi mahasiswa.

   - **Mengambil Data dari Database**:
     - Ketika aplikasi pertama kali dijalankan atau setelah data ditambahkan, aplikasi akan mengambil data mahasiswa menggunakan fungsi `queryAllRows` dan menampilkannya dalam `ListView`. Jika data kosong, aplikasi akan menampilkan pesan "Belum ada data mahasiswa".

4. **MainApp**
   - Kelas `MainApp` adalah kelas utama yang menjalankan aplikasi dan menampilkan `MainView` sebagai tampilan pertama kali ketika aplikasi dijalankan.

## Struktur Proyek

Berikut adalah struktur proyek dasar aplikasi ini:

```
lib/
├── main.dart
├── helper/
│   └── db_helper.dart
└── view/
    ├── add_mahasiswa_view.dart
    └── main_view.dart
```

### 1. **db_helper.dart**

File ini berfungsi untuk mengelola database SQLite. Dalam file ini terdapat fungsi untuk membuat database, menambahkan data, memperbarui data, menghapus data, dan mengambil data.

#### Contoh kode:

```dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE mahasiswa(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        nim TEXT,
        alamat TEXT,
        hobi TEXT
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('mahasiswa', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await database;
    return await db.query('mahasiswa');
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.update(
      'mahasiswa',
      row,
      where: 'id = ?',
      whereArgs: [row['id']],
    );
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(
      'mahasiswa',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
```

### 2. **add_mahasiswa_view.dart**

File ini digunakan untuk membuat tampilan form untuk menambahkan data mahasiswa ke database.

#### Contoh kode:

```dart
import 'package:flutter/material.dart';
import '../helper/db_helper.dart';

class AddMahasiswaView extends StatefulWidget {
  final Function refreshData;

  const AddMahasiswaView({Key? key, required this.refreshData}) : super(key: key);

  @override
  _AddMahasiswaViewState createState() => _AddMahasiswaViewState();
}

class _AddMahasiswaViewState extends State<AddMahasiswaView> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();
  final dbHelper = DatabaseHelper();

  void addMahasiswa() async {
    await dbHelper.insert({
      'nama': _namaController.text,
      'nim': _nimController.text,
      'alamat': _alamatController.text,
      'hobi': _hobiController.text,
    });
    widget.refreshData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _namaController, decoration: InputDecoration(labelText: 'Nama')),
            TextField(controller: _nimController, decoration: InputDecoration(labelText: 'NIM')),
            TextField(controller: _alamatController, decoration: InputDecoration(labelText: 'Alamat')),
            TextField(controller: _hobiController, decoration: InputDecoration(labelText: 'Hobi')),
            ElevatedButton(
              onPressed: addMahasiswa,
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 3. **main_view.dart**

File ini digunakan untuk menampilkan data mahasiswa dalam bentuk daftar. Data ditampilkan dalam `ListView` yang dapat menampilkan nama, NIM, alamat, dan hobi mahasiswa.

#### Contoh kode:

```dart
import 'package:flutter/material.dart';
import '../helper/db_helper.dart';
import 'add_mahasiswa_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> mahasiswaList = [];

  void refreshData() async {
    final data = await dbHelper.queryAllRows();
    setState(() {
      mahasiswaList = data;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata Mahasiswa'),
      ),
      body: mahasiswaList.isEmpty
          ? const Center(child: Text('Belum ada data mahasiswa.'))
          : ListView.builder(
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final item = mahasiswaList[index];
                return ListTile(
                  title: Text(item['nama']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NIM: ${item['nim']}'),
                      Text('Alamat: ${item['alamat']}'),
                      Text('Hobi: ${item['hobi']}'),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddMahasiswaView(refreshData: refreshData)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 4. **main.dart**

File utama untuk menjalankan aplikasi.

#### Contoh kode:

```dart
import 'package:flutter/material.dart';
import 'view/main_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}
```

## Langkah-langkah Penggunaan

1. **Menambahkan Mahasiswa**  
   Untuk menambahkan data mahasiswa, klik tombol "Tambah" pada tampilan utama dan isi form dengan informasi mahasiswa.

2. **Melihat Data Mahasiswa**  
   Data mahasiswa yang telah ditambahkan akan ditampilkan pada tampilan utama dalam bentuk daftar.

3. **Mengelola Database**  
   Fungsi untuk menambah, mengubah, dan menghapus data mahasiswa sudah tersedia. Anda dapat menambahkannya di file `db_helper.dart`.

## Dependencies

Untuk menjalankan aplikasi ini, pastikan Anda menambahkan dependencies berikut di `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.0.0+3
  path: ^1.8.0
```

## Kesimpulan

Aplikasi ini memberikan contoh penggunaan SQLite dengan Flutter untuk menyimpan dan mengelola data dalam aplikasi lokal. Anda dapat mengembangkan dan menyesuaikan aplikasi ini sesuai kebutuhan.
