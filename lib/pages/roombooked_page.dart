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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Заказ оплачен'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Image.asset('assets/images/Party Popper.png')),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Ваш заказ принят в работу',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                style: TextStyle(
                  color: AppColors.chpFG,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
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
