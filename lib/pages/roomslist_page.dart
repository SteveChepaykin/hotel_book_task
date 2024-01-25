import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';
import 'package:hotel_book_task/widgets/roomtile_widget.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(widget.hotel.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 0, left: 0, top: 2),
        child: ListView.builder(
          itemBuilder: (context, i) {
            return RoomTile(
              hotel: widget.hotel,
              room: rooms[i],
            );
          },
          itemCount: rooms.length,
        ),
      ),
    );
  }
}
