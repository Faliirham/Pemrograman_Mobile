# Pemrograman Mobile - Pertemuan 13

**NIM: 2341720121**

**NAMA: FALI IRHAM MAULANA**

---

## **Praktikum 1: Konversi Dart model ke JSON**

### Langkah 1 - 10 

- **main.dart :**

![alt text](images/code.png)

- **pizzalist.json :**

![alt text](images/code1.png)

```
Soal 2
- Masukkan hasil capture layar ke laporan praktikum Anda.
- Lakukan commit hasil jawaban Soal 2 dengan pesan "W13: Jawaban Soal 2"
```

![alt text](images/images0.jpg)

### Langkah 11 - 22

- **main.dart :** 

![alt text](images/code2.png)

- **model/pizza.dart :** 

![alt text](images/code3.png)

```
Soal 3
- Masukkan hasil capture layar ke laporan praktikum Anda.
- Lakukan commit hasil jawaban Soal 2 dengan pesan "W13: Jawaban Soal 3"
```

![alt text](images/images1.jpg)x    

### Langkah 23 - 26

- **main.dart :** 

![alt text](images/code4.png)

- **model/pizza.dart :** 

![alt text](images/code5.png)

## **Praktikum 2: Handle kompatibilitas data JSON**

### Langkah 1 - 11

- **model/pizza.dart :** 

![alt text](images/code6.png)

```
Soal 4
- Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!
- Lalu lakukan commit dengan pesan "W13: Jawaban Soal 4"
```
![alt text](images/images2.jpg)

## **Praktikum 3: Menangani error JSON**

### 1 -4 

- **model/pizza.dart :** 

![alt text](images/code7.png)

```
Soal 5
- Jelaskan maksud kode lebih safe dan maintainable!
- Capture hasil praktikum Anda dan lampirkan di README.
- Lalu lakukan commit dengan pesan "W13: Jawaban Soal 5".
```

**Penjelasan :** Kode tersebut dianggap lebih aman dan mudah dipelihara karena setiap bagian telah ditulis dengan pendekatan yang mencegah aplikasi mengalami error saat menerima data yang tidak sesuai ekspektasi. Dengan menggunakan tryParse, nilai seperti id dan price tetap bisa diproses meskipun formatnya salah atau bukan angka, sehingga konstruktor tidak akan memicu crash dan objek masih dapat dibuat dengan nilai default. Penggunaan operator null coalescing seperti ?? juga memastikan bahwa jika suatu field tidak ada atau bernilai null dalam JSON, aplikasi tetap mendapatkan nilai pengganti yang aman tanpa menyebabkan exception. Selain itu, pemisahan konstanta seperti KeyId, KeyName, dan lainnya membuat kode lebih mudah dipelihara karena jika suatu nama key berubah, cukup diperbarui pada satu tempat saja tanpa harus mencari dan mengganti di seluruh file. Struktur seperti ini menjadikan proses parsing terkontrol, mudah dicek, serta meminimalkan bug ketika sumber data berubah atau tidak konsisten.

![alt text](images/images2.jpg)

## **Praktikum 4: SharedPreferences**

- **main.dart :** 

![alt text](images/code8.png)

```
Soal 6
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.
- Lalu lakukan commit dengan pesan "W13: Jawaban Soal 6".
```

![alt text](<images/HASIL 1.gif>)

## **Praktikum 5: Akses filesystem dengan path_provider**

### Langkah 1 - 7 

- **main.dart :** 

![alt text](images/code9.png)

```
Soal 7
Capture hasil praktikum Anda dan lampirkan di README.
Lalu lakukan commit dengan pesan "W13: Jawaban Soal 7".
```
![alt text](images/images3.jpg)
