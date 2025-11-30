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