# 02_pengenalan_flutter

A new Flutter project.

## Getting Started

# Flutter Biodata App

Aplikasi ini adalah contoh sederhana dari aplikasi Flutter yang menampilkan biodata mahasiswa Software Engineering dan beberapa interaksi UI, seperti penghitungan klik tombol.

## Fitur Utama
1. **Menampilkan Biodata**: Aplikasi ini menampilkan foto profil, nama, dan deskripsi singkat tentang mahasiswa, termasuk universitas tempatnya belajar.
2. **Tema dan Gaya**: Aplikasi ini menggunakan skema warna yang bersih dengan warna biru aksen dan krem terang, serta bayangan untuk memberikan kesan mendalam pada elemen UI.
3. **Interaksi UI**: Terdapat tombol di bagian bawah aplikasi yang ketika ditekan akan mengubah nilai counter di layar.
4. **Scaffold dan AppBar**: Aplikasi menggunakan `Scaffold` untuk tata letak dasar, dengan `AppBar` yang diatur agar judul berada di tengah, menggunakan warna biru aksen.
5. **Desain Responsif**: Konten pada halaman utama ditempatkan dalam sebuah `SingleChildScrollView`, memungkinkan aplikasi untuk digulir pada perangkat dengan layar kecil.

## Komponen Utama

### 1. `MyApp`
Kelas ini adalah entry point dari aplikasi. Aplikasi dimulai dengan menjalankan `MyApp` yang merupakan subclass dari `StatelessWidget`. 
- **Tema**: Menggunakan tema dengan warna utama biru aksen, dan latar belakang scaffold berwarna krem terang. 
- **Home**: Mengatur `MyHomePage` sebagai halaman utama dengan judul "About Me".

### 2. `MyHomePage`
Kelas ini adalah halaman utama yang menggunakan `StatefulWidget`, sehingga dapat memperbarui antarmuka saat nilai counter bertambah.
- **AppBar**: Memiliki judul yang berada di tengah dan menggunakan gaya khusus (warna putih dan ukuran font lebih besar).
- **Body**: Terdiri dari beberapa elemen, seperti `CircleAvatar` untuk gambar profil, beberapa `Text` untuk menampilkan biodata, dan sebuah `Container` yang menampung deskripsi lengkap. Container ini memiliki dekorasi khusus, termasuk bayangan dan radius pada sudut.
- **FloatingActionButton**: Tombol mengambang di sudut kanan bawah yang menambah nilai counter setiap kali ditekan.

### 3. `CircleAvatar`
Digunakan untuk menampilkan gambar profil. Pada kode ini, gambar diambil dari path lokal dengan `NetworkImage`, namun bisa disesuaikan dengan file gambar lokal yang sesuai.

### 4. `Divider`
Menggunakan `Divider` untuk membatasi bagian informasi utama dengan garis horizontal berwarna biru.

### 5. `FloatingActionButton`
Tombol ini menambah nilai counter setiap kali ditekan. Warna tombol ini adalah biru aksen sesuai dengan tema utama aplikasi.

## Catatan
- **Counter**: Aplikasi ini menghitung berapa kali tombol `FloatingActionButton` ditekan, dan menampilkan jumlah klik tersebut pada layar.
- **Text Styles**: Semua teks pada aplikasi ini menggunakan gaya yang bersih dan konsisten dengan warna dan ukuran yang berbeda untuk memberikan hierarki visual.

## Tampilan
- **Foto Profil**: Menggunakan `CircleAvatar` untuk menampilkan foto profil dengan latar belakang biru muda.
- **Biodata Singkat**: Menampilkan nama, jurusan, dan universitas dalam format yang rapi dan berwarna sesuai tema.
- **Tentang Saya**: Deskripsi lebih mendetail tentang latar belakang mahasiswa, termasuk perjalanan di bidang teknologi dan motivasi dalam belajar pengembangan perangkat lunak.
![Secreenshot Tampilan](<Screenshot (1054).png>)

## Kesimpulan
Aplikasi ini merupakan contoh sederhana yang menampilkan biodata dan menggunakan beberapa fitur dasar Flutter, seperti state management, layouting, dan styling. Aplikasi ini juga menunjukkan bagaimana mengatur tema global untuk konsistensi tampilan.

