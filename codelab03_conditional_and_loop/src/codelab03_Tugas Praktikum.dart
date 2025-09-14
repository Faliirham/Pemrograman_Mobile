void main() {

  String nama = "Fali Irham Maulana";
  String nim = "2341720121";

  for (int angka = 0; angka <= 201; angka++) {
    bool prima = true;

    if (angka < 2) {
      prima = false;
    } else {
      for (int i = 2; i <= angka ~/ 2; i++) {
        if (angka % i == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print("Bilangan prima: $angka");
      print("Nama : $nama");
      print("NIM  : $nim");
      print("--------------");
    }
  }
}
