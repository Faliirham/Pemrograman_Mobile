const KeyId = 'id';
const KeyName = 'pizzaName';
const KeyDescription = 'description';
const KeyPrice = 'price';
const KeyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[KeyId].toString()) ?? 0,
        pizzaName = (json[KeyName] ?? 'No name')
          .toString(),
        description = (json[KeyDescription] ?? '')
          .toString(),
        price = double.tryParse(json[KeyPrice].toString()) ?? 0,
        imageUrl = json[KeyImage] ?? '';
        
  Map<String, dynamic> toJson() {
    return {
      KeyId: id,
      KeyName: pizzaName,
      KeyDescription: description,
      KeyPrice: price,
      KeyImage: imageUrl,
    };
  }

}