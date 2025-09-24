void main () {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  print(tukar((1, 2)));

  (String, int) mahasiswa = ('Fali Irham Maulana', 2341720121);
  print(mahasiswa);

  var mahasiswa2 = ('first', a: 'Fali Irham Maulana', b: true, '2341720121',);

  print(mahasiswa2.$1);
  print(mahasiswa2.a);
  print(mahasiswa2.b); 
  print(mahasiswa2.$2);
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}