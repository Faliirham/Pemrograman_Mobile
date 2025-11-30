# Pemrograman Mobile - Pertemuan 12

**NIM: 2341720121**

**NAMA: FALI IRHAM MAULANA**

---

## **Praktikum 1: Dart Streams**

### Langkah 1 - 6 

- **main.dart :**

![alt text](images/code1.png)

- **stream.dart :**

![alt text](images/code.png)

```
Soal 3
- Jelaskan fungsi keyword yield* pada kode tersebut!
- Apa maksud isi perintah kode tersebut?
- Lakukan commit hasil jawaban Soal 3 dengan pesan "W12: Jawaban Soal 3"
```

**Penjelasan :** Kode tersebut mendefinisikan sebuah fungsi getColorStream() yang menghasilkan stream warna secara periodik menggunakan Stream.periodic. Keyword yield* pada kode ini berfungsi untuk menyalurkan semua nilai yang dihasilkan oleh stream lain—dalam hal ini Stream.periodic—ke dalam stream yang sedang dibuat, sehingga setiap nilai dari Stream.periodic akan diteruskan ke stream getColorStream. Stream.periodic sendiri membuat sebuah stream yang memancarkan nilai secara berkala, di sini setiap satu detik. Fungsi callback (int t) menghitung indeks warna berdasarkan sisa bagi dari t dengan panjang daftar warna, sehingga warna yang dikembalikan dari list colors akan berulang secara melingkar. Dengan demikian, fungsi ini menghasilkan aliran warna yang berganti setiap detik sesuai urutan daftar colors dan terus berulang tanpa henti.

### Langkah 7 - 12 

- **main.dart**

![alt text](images/code2.png)

```
Soal 4
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
- Lakukan commit hasil jawaban Soal 4 dengan pesan "W12: Jawaban Soal 4"
```

![alt text](<images/hasil 1.gif>)

### Langkah 13: Ganti isi method changeColor()

- **main.dart**

```
Soal 5
Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !
Lakukan commit hasil jawaban Soal 5 dengan pesan "W12: Jawaban Soal 5"
```

Perbedaan antara listen dan await for pada stream terletak pada cara mereka menangani event yang dipancarkan oleh stream. Pada await for, setiap event stream diproses secara asinkron dalam sebuah loop, sehingga eksekusi kode bersifat sekuensial dan menunggu setiap event sebelum melanjutkan ke langkah berikutnya. Hal ini membuat aliran data lebih mudah diikuti karena terlihat seperti loop biasa, tetapi kode setelah await for tidak akan dijalankan sampai stream selesai atau dihentikan. Sementara itu, listen mendaftarkan sebuah callback yang dipanggil setiap kali stream memancarkan event, dengan eksekusi bersifat non-blok, sehingga kode setelah listen langsung dijalankan tanpa menunggu event. listen juga memberikan fleksibilitas lebih, misalnya untuk membatalkan langganan stream kapan saja. Secara singkat, await for lebih cocok untuk menangani event secara linear dan berurutan, sedangkan listen lebih cocok untuk menangani event secara asynchronous tanpa menghentikan eksekusi kode lain.