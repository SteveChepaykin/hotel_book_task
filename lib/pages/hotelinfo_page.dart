import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_book_task/colors.dart';
import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';
import 'package:hotel_book_task/pages/roomslist_page.dart';
import 'package:hotel_book_task/widgets/fabelevatedbutton_widget.dart';
import 'package:hotel_book_task/widgets/hotelmaininfo_widget.dart';
import 'package:hotel_book_task/widgets/imagecarousel_widget.dart';

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Отель'),
        centerTitle: true,
        // backgroundColor: Colors.transparent,
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
                  ImageCarousel(images: [
                    widget.hotel.assetimage,
                    widget.hotel.assetimage,
                    widget.hotel.assetimage,
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  HotelMainInfo(hotel: widget.hotel),
                  const SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'от ${widget.hotel.price.toStringAsFixed(0)}₽ ',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const TextSpan(
                          text: 'за тур с перелетом',
                          style: TextStyle(color: AppColors.chpFG),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 80),
            sliver: SliverToBoxAdapter(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Об отеле',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        Wrap(
                          spacing: 4,
                          children: [
                            ...widget.hotel.pluses.map(
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
                        Text(
                          widget.hotel.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        expandableInfo(
                          'Удобства',
                          'assets/icons/emoji-happy.png',
                          widget.hotel.goods,
                        ),
                        expandableInfo(
                          'Что включено',
                          'assets/icons/tick-square.png',
                          widget.hotel.whatin,
                        ),
                        expandableInfo(
                          'Что не включено',
                          'assets/icons/close-square.png',
                          widget.hotel.whatout,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FabElevatedButton(
        action: () {
          Get.to(
            () => RoomsListPage(hotel: widget.hotel),
          );
        },
        text: 'К выбору номера',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget expandableInfo(String title, String image, List<dynamic> list) => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white, // here for close state
          colorScheme: const ColorScheme.light(
            primary: AppColors.blue,
          ),
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(title),
          subtitle: const Text('Самое необходимое'),
          leading: ImageIcon(AssetImage(image)),
          children: [
            ...list.map(
              (e) => ListTile(
                title: Text(e),
              ),
            ),
          ],
        ),
      );
}
