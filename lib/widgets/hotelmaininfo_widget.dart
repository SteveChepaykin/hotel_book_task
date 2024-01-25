import 'package:flutter/material.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';

class HotelMainInfo extends StatelessWidget {
  final HotelModel hotel;
  const HotelMainInfo({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: AppColors.paleyellow, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: AppColors.yellow,
                size: 16,
              ),
              Text(
                '${hotel.rating.toStringAsFixed(2)} ${hotel.getWordByRating()}',
                style: const TextStyle(color: AppColors.yellow),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          hotel.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          hotel.adress,
          style: const TextStyle(color: AppColors.blue),
        ),
      ],
    );
  }
}
