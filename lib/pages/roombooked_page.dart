import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/pages/hotelinfo_page.dart';
import 'package:hotel_book_task/widgets/fabelevatedbutton_widget.dart';

class RoomBookedPage extends StatelessWidget {
  final HotelModel hotel;
  const RoomBookedPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
      ),
      floatingActionButton: FabElevatedButton(
        action: () {
          // Get.offUntil(Route<HotelInfoPage>(settings: MaterialPage(child: HotelInfoPage(hotel: hotel))), (route) => route.isFirst);
          Get.until((route) => route.isFirst);
          Get.to(HotelInfoPage(hotel: hotel));
        },
        text: 'Супер!',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
