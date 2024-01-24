class RoomModel {
  final String id;
  late final String name;
  late final double price;
  late final List<String> goods;

  RoomModel.fromMap(this.id, Map<String, dynamic> map) {
    name = map['name'] != null ? map['name'] as String : throw 'NEED ROOM NAME IN ROOM $id';
    price = map['price'] != null ? map['price'] as double : throw 'NEED PRICE IN ROOM $id';
    goods = map['goods'] != null && map['goods'] is List ? (map['goods'] as List).map((e) => e as String).toList() : throw 'NEED GOODS LIST IN ROOM $id';
  }
}