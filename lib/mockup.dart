import 'package:hotel_book_task/models/hotelmodel.dart';
import 'package:hotel_book_task/models/roommodel.dart';

class Mockup {
  static final hotels = <HotelModel>[
    HotelModel.fromMap('10001', {
      'name': 'Steigenberger Makadi',
      'assetimage': 'assets/images/image 20.png',
      'description':
          'Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!',
      'adress': 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
      'rating': 5.0,
      'price': 136690.0,
      'goods': [
        'Хороший интернет',
        'Кондиционеры',
        'Раздельный санузел',
      ],
      'pluses': [
        '3-я линия',
        'Платный WI-FI в фойе',
        '1 км до пляжа',
        '30 км до аэропорта',
      ],
      'whatin': [
        'Затврак',
        'Обед',
      ],
      'whatout': [
        'Ужин',
        'Экскурсии',
      ],
      'rooms': [
        '201',
        '202',
        '203',
      ]
    }),
    HotelModel.fromMap('10002', {
      'name': 'Крутейший Отель',
      'assetimage': 'assets/images/image 20.png',
      'description': 'Самый лучший отель средиземноморья',
      'adress': 'Madinat Makadi, Safaga Road, Makadi Bay, Египет',
      'rating': 4.78,
      'price': 150890.0,
      'goods': [
        'Бесплатный WI-FI',
        'Кондиционеры',
      ],
      'pluses': [
        '1-я линия',
        'Платный WI-FI в фойе',
        '1 км до пляжа',
        '30 км до аэропорта',
      ],
      'whatin': [
        'Затврак',
      ],
      'whatout': [
        'Обед',
        'Ужин',
      ],
      'rooms': [
        '204',
      ]
    }),
  ];

  static final rooms = <RoomModel>[
    RoomModel.fromMap(
      '201',
      {
        'name': 'Стандартный с видом на бассейн или сад',
        'price': 186600.0,
        'goods': [
          'Все включено',
          'Кондиционер',
        ],
      },
    ),
    RoomModel.fromMap(
      '202',
      {
        'name': 'Крутой с видом на бассейн или сад',
        'price': 158690.0,
        'goods': [
          'Все включено',
          'Кондиционер',
        ],
      },
    ),
    RoomModel.fromMap(
      '203',
      {
        'name': 'Супер крутой с видом на бассейн',
        'price': 134700.0,
        'goods': [
          'Все включено',
          'Кондиционер',
        ],
      },
    ),
    RoomModel.fromMap(
      '204',
      {
        'name': 'Обычный с видом на сад',
        'price': 179800.0,
        'goods': [
          'Все включено',
          'Кондиционер',
        ],
      },
    ),
  ];
}
