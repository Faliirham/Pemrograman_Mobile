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

### Langkah 5: Tambah kode di ElevatedButton

![alt text](images/code2.png)

```
Soal 3
Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 3".
```

**Jawaban :** Pada langkah tersebut, substring digunakan untuk mengambil sebagian isi respons dari server, tepatnya hanya karakter dari indeks 0 sampai 450, sehingga data yang ditampilkan tidak seluruhnya tetapi dipotong agar lebih ringkas atau menghindari teks yang terlalu panjang. Sementara itu, catchError berfungsi menangkap dan menangani error yang mungkin terjadi ketika proses getData dijalankan, misalnya ketika koneksi gagal atau server tidak merespons. Jika terjadi error, blok catchError akan men-set nilai result menjadi pesan “An error occurred” sehingga aplikasi tetap memberikan keluaran yang jelas dan tidak crash, kemudian memanggil setState untuk memperbarui tampilan sesuai kondisi tersebut.

![alt text](<images/hasil 1.gif>)

## **Praktikum 2: Menggunakan await/async untuk menghindari callbacks**

### Langkah 1 - 4

![alt text](images/code3.png)

```
Soal 4
- Jelaskan maksud kode langkah 1 dan 2 tersebut!
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 4".
```
**Penjelasan :** Pada langkah pertama, tiga fungsi asynchronous dibuat untuk mensimulasikan proses yang memerlukan waktu, masing-masing menunggu tiga detik sebelum mengembalikan nilai 1, 2, dan 3. Fungsi returnOneAsync, returnTwoAsync, dan returnThreeAsync menggunakan await Future.delayed untuk menunda pengembalian hasil, sehingga dapat menggambarkan proses seperti pengambilan data dari server atau perhitungan berat yang tidak langsung selesai.

Pada langkah kedua, fungsi count menjalankan ketiga fungsi asynchronous tersebut secara berurutan menggunakan await sehingga setiap proses harus benar-benar selesai sebelum melanjutkan ke proses berikutnya. Nilai yang dikembalikan dari masing-masing fungsi dijumlahkan ke dalam variabel total, lalu hasil akhirnya ditampilkan ke antarmuka melalui setState dengan mengubah variabel result menjadi nilai total tersebut.

![alt text](<images/hasil 2.gif>)


## **Praktikum 3: Menggunakan Completer di Future**

### Langkah 1- 4 

![alt text](images/code4.png)

```
Soal 5
- Jelaskan maksud kode langkah 2 tersebut!
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 5".
```

**Penjelasan :** Kode pada langkah tersebut menunjukkan cara kerja Completer untuk membuat sebuah future yang kendali penyelesaiannya ditentukan secara manual. Variabel completer dideklarasikan sebagai late, artinya ia akan diinisialisasi nanti ketika fungsi getNumber dipanggil. Di dalam getNumber, sebuah objek Completer<int> dibuat sehingga menghasilkan future yang belum terselesaikan, lalu fungsi calculate dijalankan untuk melakukan proses asynchronous. Ketika calculate dijalankan, ia menunggu selama lima detik menggunakan Future.delayed sebagai simulasi proses yang memerlukan waktu, dan setelah waktu tersebut selesai, completer.complete dipanggil untuk memberikan nilai 42 sebagai hasil akhir.

![alt text](<images/hasil 3.gif>)

### Langkah 5 - 6 

![alt text](images/code5.png)

```
Soal 6
- Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 6".
```

**Penjelasan :** Perbedaan antara langkah 2 dan langkah 5–6 terletak pada cara keduanya menangani proses asynchronous serta bagaimana mereka menghadapi kemungkinan terjadinya error. Pada langkah 2, fungsi calculate berjalan tanpa mekanisme penanganan kesalahan; ia hanya menunggu lima detik dan kemudian memanggil completer.complete untuk menyelesaikan future dengan nilai 42. Jika terjadi kegagalan, misalnya completer sudah pernah diselesaikan sebelumnya, fungsi tersebut tidak memiliki cara untuk memberikan sinyal bahwa kesalahan terjadi sehingga errornya dapat menyebabkan aplikasi berhenti atau memunculkan pengecualian yang tidak tertangani. Sementara itu, langkah 5–6, yaitu calculate2 dan pemanggilan getNumber di dalam onPressed, menambahkan lapisan keamanan dengan try–catch. Jika terjadi error selama proses asynchronous, completer.completeError dipanggil untuk mengirimkan error sebagai nilai future. Bagian onPressed kemudian memanfaatkan catchError untuk menangkap error tersebut sehingga aplikasi dapat menampilkan pesan yang lebih ramah, seperti “An error occurred,” tanpa membuat aplikasi crash.

![alt text](<images/hasil 4.gif>)

## **Praktikum 4: Memanggil Future secara paralel**

### Langkah 1 - 3

![alt text](images/code6.png)

```
Soal 7
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".
```

![alt text](<images/hasil 5.gif>)

### Langkah 4: : Ganti variabel futureGroup

![alt text](images/code7.png)

```
Soal 8
Jelaskan maksud perbedaan kode langkah 1 dan 4!
```

**Penjelasan :** Perbedaan antara langkah 1 dan langkah 4 terletak pada cara keduanya menjalankan beberapa future sekaligus serta bagaimana hasil akhirnya diproses. Pada langkah 1, kode menggunakan FutureGroup, yaitu mekanisme yang mengumpulkan beberapa future secara bertahap, menutup grup dengan close, lalu menunggu semua future selesai sebelum memberikan daftar hasil. Setelah semua nilai diterima, kode melakukan perulangan manual untuk menjumlahkan seluruh elemen dan menampilkannya melalui setState. Struktur ini lebih panjang karena FutureGroup bekerja seperti “keranjang future” yang dapat ditambahkan satu per satu sebelum ditutup.

Sebaliknya, pada langkah 4 digunakan Future.wait yang merupakan cara lebih ringkas dan langsung untuk menjalankan beberapa future secara paralel. Future.wait menerima list future dan mengembalikan sebuah future baru yang selesai ketika semua future di dalamnya selesai, serta menghasilkan list nilai yang urut sesuai posisi future yang diberikan. Dengan kata lain, Future.wait memberikan fungsi yang sama seperti FutureGroup tetapi dengan penulisan jauh lebih sederhana dan tanpa perlu langkah tambahan seperti close atau pengaturan grup. Pada kode langkah 4, nilai hasil dari Future.wait belum diproses, tetapi intinya mekanisme ini menggantikan seluruh proses FutureGroup dengan satu baris yang lebih efisien.

## **Praktikum 5: Menangani Respon Error pada Async Code**

### Langkah 1 - 3 

![alt text](images/code8.png)

```
Soal 9
Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".
```

![alt text](<images/hasil 6.gif>)