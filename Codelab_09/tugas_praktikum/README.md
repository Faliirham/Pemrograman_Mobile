# Pemrograman Mobile - Pertemuan 9 

**NIM: 2341720121**

**NAMA: FALI IRHAM MAULANA**

---

## 2. Hasil Gabungan Praktikum 1 dan Praktikum 2 : 

- **Tampilan saat pemilihan Filter :**

![alt text](images/images1.jpg)

- **Tampilan saat Foto diambil menggunakan Filter :**

## 3. Jelaskan maksud void async pada praktikum 1? 

**Jawaban :** Dalam praktikum Flutter, penulisan void async pada sebuah fungsi menunjukkan bahwa fungsi tersebut bekerja secara asynchronous. Artinya, di dalam fungsi tersebut terdapat proses yang membutuhkan waktu, seperti menunggu data dari internet, membaca file, atau operasi lain yang menggunakan await. Secara teknis, fungsi yang diberi kata kunci async sebenarnya akan selalu mengembalikan Future<void>, tetapi Flutter memperkenankan penulisan void async agar lebih sederhana, terutama untuk pemula. Dengan menambahkan async, sebuah fungsi dapat menunggu proses tanpa menghentikan eksekusi program utama, sehingga aplikasi tetap responsif.


## Jelaskan fungsi dari anotasi @immutable dan @override ?

**Jawaban :** Anotasi @immutable digunakan pada sebuah class untuk menandakan bahwa seluruh nilai di dalam class tersebut tidak boleh diubah setelah objeknya dibuat. Dalam Flutter, prinsip immutability sangat penting, terutama untuk widget yang seharusnya bersifat statis dan tidak berubah-ubah. Dengan memberikan anotasi @immutable, pengembang mendapat peringatan apabila mencoba mengubah nilai dalam class tersebut, sehingga struktur kode menjadi lebih aman dan konsisten.

Sementara itu, anotasi @override digunakan ketika sebuah method ingin ditulis ulang dari method yang dimiliki oleh class induknya. Dalam Flutter, ini sering dipakai pada method seperti build(), initState(), atau dispose() yang berasal dari class parent seperti State atau Widget. Penggunaan @override membantu compiler memastikan bahwa method yang ditulis benar-benar menggantikan method induk, sehingga apabila terjadi kesalahan penulisan nama atau tipe parameter, error akan langsung terdeteksi. Dengan demikian, anotasi ini menjaga agar kode tetap konsisten, jelas, dan mudah dipelihara.