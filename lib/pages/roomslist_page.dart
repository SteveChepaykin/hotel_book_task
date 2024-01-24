import 'package:flutter/material.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';

class RoomsListPage extends StatefulWidget {
  final HotelModel hotel;
  const RoomsListPage({
    super.key,
    required this.hotel,
  });

  @override
  State<RoomsListPage> createState() => _RoomsListPageState();
}

class _RoomsListPageState extends State<RoomsListPage> {
  late final List<RoomModel> rooms;

  @override
  void initState() {
    rooms = widget.hotel.getRooms();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotel.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: ListView.builder(
          itemBuilder: (context, i) {},
          itemCount: rooms.length,
        ),
      ),
    );
  }
}
