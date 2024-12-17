# Praktikum Guided dan Unguided 07: Navigasi & Notifikasi

## Deskripsi

Praktikum ini mengajarkan konsep dasar navigasi dalam aplikasi Flutter. Pada bagian Guided, pengguna membuat model data sederhana dan navigasi ke halaman detail dengan tampilan placeholder. Sedangkan pada bagian Unguided, pengguna mengembangkan navigasi dan halaman detail untuk menampilkan data produk secara dinamis.

---

## Guided Code

### 1. `Product` Class

Model data untuk produk.

```dart
class Product {
  final int id;
  final String nama;
  final double harga;
  final String imageUrl;
  final String deskripsi;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    required this.imageUrl,
    required this.deskripsi,
  });

  // Konversi JSON ke objek Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      nama: json["nama"],
      harga: json["harga"].toDouble(),
      imageUrl: json["imageUrl"],
      deskripsi: json["deskripsi"],
    );
  }
}
```

**Penjelasan**:

- Model ini mendefinisikan properti seperti `id`, `nama`, `harga`, `imageUrl`, dan `deskripsi`.
- `fromJson` digunakan untuk memproses data JSON ke dalam bentuk objek.

---

### 2. Halaman Detail Produk (`DetailProduct`)

Halaman detail sederhana dengan teks placeholder.

```dart
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Detail product',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: const Center(
        child: Text('ini adalah page detail'),
      ),
    );
  }
}
```

**Penjelasan**:

- Menggunakan `Scaffold` untuk struktur halaman.
- `AppBar` berjudul "Detail product."
- Halaman menampilkan teks placeholder.

---

### 3. Halaman Utama Produk (`Mypage`)

Menampilkan daftar produk dengan navigasi ke halaman detail.

```dart
import 'package:flutter/material.dart';
import 'package:navigasinotifikasi/model/product.dart';
import 'package:navigasinotifikasi/pages/detail.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final List<Product> products = [
    Product(
        id: 1,
        nama: 'mouse',
        harga: 280000.00,
        imageUrl:
            'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1',
        deskripsi: 'mahal bos'),
    Product(
        id: 2,
        nama: 'keyboard',
        harga: 400000.00,
        imageUrl:
            'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1',
        deskripsi: 'untuk midrange'),
    Product(
        id: 3,
        nama: 'headphone',
        harga: 200000.00,
        imageUrl:
            'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg',
        deskripsi: 'kemurahan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Model'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(
              product.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga: Rp ${product.harga.toStringAsFixed(0)}'),
                Text('Deskripsi: ${product.deskripsi}'),
              ],
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailProduct()
                  )
              );
            },
          );
        },
      ),
    );
  }
}
```

**Penjelasan**:

- Produk ditampilkan menggunakan `ListView.builder`.
- Klik pada item akan membawa pengguna ke halaman detail.

---

### 4. Main Entry Point

```dart
import 'package:flutter/material.dart';
import 'package:navigasinotifikasi/pages/mypage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mypage(),
    );
  }
}
```

**Penjelasan**:

- `Mypage` digunakan sebagai halaman utama aplikasi.

---

## Unguided Code

### 1. `Product` Class

Model ini sama dengan kode Guided.

---

### 2. Halaman Detail Produk (`DetailProduct`)

Halaman detail dengan data dinamis.

```dart
import 'package:flutter/material.dart';

class DetailProduct extends StatelessWidget {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  const DetailProduct({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.blue[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Price: Rp ${price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
```

**Penjelasan**:

- Halaman detail menampilkan gambar, nama, harga, dan deskripsi produk yang dipilih.

---

### 3. Halaman Utama Produk (`Mypage`)

Menggunakan `Card` untuk tampilan lebih menarik.

```dart
// Sama seperti Guided, dengan tambahan navigasi data dinamis.
```

---

## Perbedaan Guided dan Unguided

1. **Guided**:

   - Halaman detail menggunakan placeholder.
   - Navigasi tidak mengirimkan data produk.

2. **Unguided**:
   - Halaman detail menampilkan data dinamis dari produk.
   - Tampilan lebih menarik dengan `Card` dan tata letak yang lebih baik.

```

```
