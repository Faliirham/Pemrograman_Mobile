# Pemrograman Mobile - Pertemuan 10

**NIM: 2341720121**

**NAMA: FALI IRHAM MAULANA**

---

## **Praktikum 1: Mengunduh Data dari Web Service (API)**

### Langkah 1 Buat Project Baru

![alt text](image.png)

### Langkah 2: Cek file pubspec.yaml

![alt text](image-1.png)

### Langkah 3: Buka file main.dart

![alt text](images/code.png)

```
Soal 1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
```

![alt text](images/code1.png)

### Langkah 4: Tambah method getData()

```
Soal 2 Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2"
```
![alt text](image-2.png)

### 5: Tambah kode di ElevatedButton

![alt text](images/code2.png)

```
Soal 3
Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
```

**Jawaban :** Pada langkah tersebut, substring digunakan untuk mengambil sebagian isi respons dari server, tepatnya hanya karakter dari indeks 0 sampai 450, sehingga data yang ditampilkan tidak seluruhnya tetapi dipotong agar lebih ringkas atau menghindari teks yang terlalu panjang. Sementara itu, catchError berfungsi menangkap dan menangani error yang mungkin terjadi ketika proses getData dijalankan, misalnya ketika koneksi gagal atau server tidak merespons. Jika terjadi error, blok catchError akan men-set nilai result menjadi pesan “An error occurred” sehingga aplikasi tetap memberikan keluaran yang jelas dan tidak crash, kemudian memanggil setState untuk memperbarui tampilan sesuai kondisi tersebut.

![alt text](<images/hasil 1.gif>)