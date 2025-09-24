void main (){
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };
  var mhs1 = Map<String, String>();
    gifts['first'] = 'partridge';
    gifts['second'] = 'turtledoves';
    gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
    nobleGases[2] = 'helium';
    nobleGases[10] = 'neon';
    nobleGases[18] = 'argon';

  // Menambahkan nama dan NIM ke semua map
  gifts['name'] = 'Fali Irham Maulana';
  gifts['nim'] = '2341720121';

  nobleGases[20] = 'Fali Irham Maulana';
  nobleGases[21] = '2341720121';

  mhs1['name'] = 'Fali Irham Maulana';
  mhs1['nim'] = '2341720121';

  mhs2[20] = 'Fali Irham Maulana';
  mhs2[21] = '2341720121';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}