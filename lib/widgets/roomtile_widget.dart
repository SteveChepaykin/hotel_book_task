import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';
import 'package:hotel_book_task/pages/bookroom_page.dart';
import 'package:hotel_book_task/widgets/fabelevatedbutton_widget.dart';
import 'package:hotel_book_task/widgets/imagecarousel_widget.dart';

class RoomTile extends StatelessWidget {
  final HotelModel hotel;
  final RoomModel room;
  const RoomTile({
    super.key,
    required this.hotel,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(images: [
              room.assetimage,
              room.assetimage,
              room.assetimage,
              room.assetimage
            ]),
            const SizedBox(
              height: 4,
            ),
            Text(
              room.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Wrap(
              spacing: 4,
              children: [
                ...room.goods.map(
                  (e) => Chip(
                    backgroundColor: AppColors.chipBG,
                    side: const BorderSide(color: Colors.transparent),
                    padding: const EdgeInsets.all(2),
                    label: Text(
                      e,
                      style: const TextStyle(color: AppColors.chpFG),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: AppColors.blue.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Подробнее о номере',
                      style: TextStyle(color: AppColors.blue),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'от ${room.price.toStringAsFixed(0)}₽ ',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(
                    text: 'за 7 дней с перелетом',
                    style: TextStyle(color: AppColors.chpFG),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FabElevatedButton(
              action: () {
                Get.to(
                  () => BookRoomPage(
                    hotel: hotel,
                    room: room,
                  ),
                );
              },
              text: 'Выбрать номер',
              horpadding: 0,
            )
          ],
        ),
      ),
    );
  }
}
