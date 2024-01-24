import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';

class HotelInfoPage extends StatefulWidget {
  final HotelModel hotel;
  const HotelInfoPage({super.key, required this.hotel});

  @override
  State<HotelInfoPage> createState() => _HotelInfoPageState();
}

class _HotelInfoPageState extends State<HotelInfoPage> {
  late final List<RoomModel> rooms;

  @override
  void initState() {
    rooms = widget.hotel.getRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Отель'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      widget.hotel.assetimage,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    color: AppColors.paleyellow,
                    child: Text(
                      widget.hotel.rating.toStringAsFixed(2),
                    ),
                  ),
                  Text(widget.hotel.adress),
                  Text(widget.hotel.name),
                  Text(
                    widget.hotel.price.toStringAsFixed(0),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('khgvhjgkjgkjhkjgjgjgkjhkghkjlgkljgklglijhhlkhkjhkjhkhlhjlkhkjlhklhlkh;lkh;klj'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
