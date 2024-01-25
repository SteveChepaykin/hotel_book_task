import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';
import 'package:hotel_book_task/models/touristmodel.dart';
import 'package:hotel_book_task/pages/roombooked_page.dart';
import 'package:hotel_book_task/widgets/fabelevatedbutton_widget.dart';
import 'package:hotel_book_task/widgets/hotelmaininfo_widget.dart';
import 'package:hotel_book_task/widgets/input_widget.dart';
import 'package:hotel_book_task/widgets/touristform_widget.dart';

class BookRoomPage extends StatefulWidget {
  final HotelModel hotel;
  final RoomModel room;
  const BookRoomPage({super.key, required this.hotel, required this.room});

  @override
  State<BookRoomPage> createState() => _BookRoomPageState();
}

class _BookRoomPageState extends State<BookRoomPage> {
  TextEditingController buyerNumber = TextEditingController();
  TextEditingController buyerMail = TextEditingController();

  List<TouristModel> tourists = [TouristModel.empty(1)];

  double fuel = 9300.0;
  double service = 2136.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Бронирование'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: HotelMainInfo(
                  hotel: widget.hotel,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoRow('Вылет из', 'Санкт-Петербург'),
                    infoRow('Страна, город', 'Египет, Хургада'),
                    infoRow('Даты', '19.09.2023 - 27.09.2023'),
                    infoRow('Кол-во ночей', '7 ночей'),
                    infoRow('Отель', widget.hotel.name),
                    infoRow('Номер', widget.room.name),
                    infoRow('Питание', 'Все включено'),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Информация о покупателе',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Input('Номер', buyerNumber),
                    Input('Почта', buyerMail),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      style: TextStyle(
                        color: AppColors.chpFG,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...tourists.map(
                  (e) => TouristForm(tourist: e),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Добавить туриста',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          tourists.add(TouristModel.empty(tourists.length + 1));
                        });
                      },
                      icon: const Icon(
                        Icons.add_box_rounded,
                        color: AppColors.blue,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkRow('Тур', widget.room.price),
                    checkRow('Топливный сбор', fuel),
                    checkRow('Сервисный сбор', service),
                    checkRow('К оплате', sum(), isSum: true)
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
            ),
          ),
        ],
      ),
      floatingActionButton: FabElevatedButton(action: action, text: 'Оплатить ${sum()}'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  double sum() {
    return widget.room.price + fuel + service;
  }

  void action() {
    if (buyerMail.text != '' && buyerNumber.text != '') {
      bool okay = true;
      for (TouristModel t in tourists) {
        if (!t.check()) {
          okay = false;
        }
      }
      if (okay) {
        Get.to(() => RoomBookedPage(hotel: widget.hotel,));
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            message: 'Не все данные заполнены для оформления заказа.',
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Не все данные заполнены для оформления заказа.',
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget infoRow(String label, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 60,
            child: Text(
              label,
              style: const TextStyle(color: AppColors.chpFG, fontSize: 19),
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ],
      );

  Widget checkRow(String label, double value, {bool isSum = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ Text(
              label,
              style: const TextStyle(color: AppColors.chpFG, fontSize: 19),
            ),
          Flexible(
            child: Text(
              value.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 19,
                fontWeight: isSum ? FontWeight.w500 : null,
                color: isSum ? AppColors.blue : null
              ),
            ),
          ),
        ],
      );
}
