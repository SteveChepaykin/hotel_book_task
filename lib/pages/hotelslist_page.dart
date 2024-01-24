import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/mockup.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/pages/hotelinfo_page.dart';

class HotelListPage extends StatefulWidget {
  const HotelListPage({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<HotelModel> hotels = Mockup.hotels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Отели'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
        child: ListView.builder(
          itemBuilder: (context, i) {
            HotelModel hotel = hotels[i];
            return ListTile(
              title: Text(hotel.name),
              leading: Image.asset(
                hotel.assetimage,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Get.to(
                  () => HotelInfoPage(
                    hotel: hotel
                  ),
                );
              },
            );
          },
          itemCount: hotels.length,
        ),
      ),
    );
  }
}