void main() {
  var nim = [2341720121];

  var list1 = <int?>[1, 2, 3];
  var list2 = [0, ...list1, ...nim];
  print(list1);
  print(list2);
  print(list2.length);

  list1 = [1, 2, null];
  print(list1);

  var list3 = [0, ...list1, ...nim];
  print(list3);
  print(list3.length);

  var promoActive = true; 

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav);

  var login = 'Customer';

  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}