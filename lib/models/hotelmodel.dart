import 'package:hotel_book_task/mockup.dart';
import 'package:hotel_book_task/models/roommodel.dart';

class HotelModel {
  final String id;
  late final String name;
  late final String assetimage;
  late final String description;
  late final String adress;
  late final double rating;
  late final double price; 
  late final List<String> goods;
  late final List<String> pluses;
  late final List<String> whatin;
  late final List<String> whatout;
  late final List<String> rooms;

  HotelModel.fromMap(this.id, Map<String, dynamic> map) {
    name = map['name'] != null ? map['name'] as String : throw 'NEED HOTEL NAME IN HOTEL $id';
    assetimage = map['assetimage'] != null ? map['assetimage'] as String : throw 'NEED IMAGE LINK IN HOTEL $id';
    adress = map['adress'] != null ? map['adress'] as String : throw 'NEED ADRESS IN HOTEL $id';
    description = map['description'] != null ? map['description'] as String : 'No description available in this hotel';
    rating = map['rating'] != null ? map['rating'] as double : throw 'NEED RATING IN HOTEL $id';
    price = map['price'] != null ? map['price'] as double : throw 'NEED PRICE IN HOTEL $id';
    goods = map['goods'] != null && map['goods'] is List ? (map['goods'] as List).map((e) => e as String).toList() : throw 'NEED GOODS LIST IN HOTEL $id';
    pluses = map['pluses'] != null && map['pluses'] is List ? (map['pluses'] as List).map((e) => e as String).toList() : throw 'NEED PLUSES LIST IN HOTEL $id';
    whatin = map['whatin'] != null && map['whatin'] is List ? (map['whatin'] as List).map((e) => e as String).toList() : throw 'NEED WHAT IN LIST IN HOTEL $id';
    whatout = map['whatout'] != null && map['whatout'] is List ? (map['whatout'] as List).map((e) => e as String).toList() : throw 'NEED WHAT OUT LIST IN HOTEL $id';
    rooms = map['rooms'] != null && map['rooms'] is List ? (map['rooms'] as List).map((e) => e as String).toList() : throw 'NEED ROOMS LIST IN HOTEL $id';
  }

  List<RoomModel> getRooms() {
      List<RoomModel> res = [];
      for (String i in rooms) {
        RoomModel rm = Mockup.rooms.firstWhere((element) => element.id == i);
        res.add(rm);
      }
      return res;
    }
}
