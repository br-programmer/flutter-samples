import 'package:flutter/painting.dart' show Color;

class Phone {
  final String name;
  final String features;
  final String price;
  final String oldPrice;
  final bool isFavorite;
  final List<String> photos;
  final int rating;
  final List<Color> colors;
  final List<int> capacities;
  final String processor;
  final String cameras;
  final String memoryRam;

  Phone({
    this.name,
    this.features,
    this.price,
    this.oldPrice,
    this.isFavorite,
    this.photos,
    this.rating,
    this.colors,
    this.capacities,
    this.processor,
    this.cameras,
    this.memoryRam,
  });
}

final hotSales = <Phone>[
  Phone(
    name: 'Iphone 12',
    features: 'Súper. Mega. Rápido.',
    isFavorite: false,
    photos: ['assets/images/ecommerce/iphone12.png'],
  ),
  Phone(
    name: 'Samsung Galaxy Z Fold 3',
    features: 'Fexible. Ultra Rápido.',
    isFavorite: true,
    photos: ['assets/images/ecommerce/z-fold.png'],
  ),
  Phone(
    name: 'One Plus 8T',
    features: 'Súper. Veloz.',
    isFavorite: false,
    photos: ['assets/images/ecommerce/one-plus.png'],
  ),
];

final phones = <Phone>[
  Phone(
    name: 'Samsung S20 Ultra',
    features: 'Súper. Veloz.',
    isFavorite: true,
    price: '\$1,015',
    oldPrice: '\$1,050',
    photos: [
      'assets/images/ecommerce/s20-1.png',
      'assets/images/ecommerce/s20-3.png',
      'assets/images/ecommerce/s20-2.png',
    ],
    rating: 5,
    processor: 'Exynos 990',
    cameras: '108 + 12 mp',
    memoryRam: '8 GB',
    capacities: [128, 256],
    colors: [Color(0xFFBBDDF0), Color(0xFF676767)],
  ),
  Phone(
    name: 'Xiaomi MI 10 Pro',
    features: 'Súper. Veloz.',
    isFavorite: false,
    price: '\$300',
    oldPrice: '\$400',
    photos: [
      'assets/images/ecommerce/xioami-1.png',
      'assets/images/ecommerce/xioami-3.png',
      'assets/images/ecommerce/xioami-2.png',
    ],
    rating: 3,
    processor: 'Snapdragon 865',
    cameras: '108 + 8 mp',
    memoryRam: '8 GB',
    capacities: [256],
    colors: [Color(0xFF567F9B), Color(0xFF4F4955)],
  ),
  Phone(
    name: 'Samsung Note 20 Ultra',
    features: 'Súper. Veloz.',
    isFavorite: true,
    price: '\$1,047',
    oldPrice: '\$1,500',
    photos: [
      'assets/images/ecommerce/note-3.png',
      'assets/images/ecommerce/note-2.png',
      'assets/images/ecommerce/note-1.png',
    ],
    rating: 5,
    processor: 'Exynos 990',
    cameras: '108 + 12 mp',
    memoryRam: '8 GB',
    capacities: [128, 256],
    colors: [Color(0xFFAA857E), Color(0xFF88AA9A)],
  ),
  Phone(
    name: 'Motorola One Edge',
    features: 'Súper. Veloz.',
    isFavorite: true,
    price: '\$999',
    oldPrice: '\$910',
    photos: [
      'assets/images/ecommerce/moto-1.png',
      'assets/images/ecommerce/moto-3.png',
      'assets/images/ecommerce/moto-2.png',
    ],
    rating: 5,
    processor: 'Snapdragon 865',
    cameras: '108 + 25 mp',
    memoryRam: '12 GB',
    capacities: [256],
    colors: [Color(0xFF4D5D76), Color(0xFF763E69)],
  ),
  Phone(
    name: 'One Plus 8T',
    features: 'Súper. Veloz.',
    isFavorite: false,
    price: '\$599',
    oldPrice: '\$520',
    photos: [
      'assets/images/ecommerce/one-1.png',
      'assets/images/ecommerce/one-3.png',
      'assets/images/ecommerce/one-2.png',
    ],
    rating: 3,
    processor: 'Snapdragon 865',
    cameras: '48 + 5 mp',
    memoryRam: '12 GB',
    capacities: [128, 256],
    colors: [Color(0xFF00969F), Color(0xFF4880A5)],
  ),
];

class Cart {
  final int count;
  final Phone phone;

  Cart({this.count, this.phone});
}

final cart = <Cart>[
  Cart(
    count: 2,
    phone: Phone(name: 'Galaxy Note 20 Ultra', price: '\$3000.0', photos: ['assets/images/ecommerce/note.png']),
  ),
  Cart(
    count: 1,
    phone: Phone(name: 'Iphone 12 Mini', price: '\$1000.0', photos: ['assets/images/ecommerce/iphone.png']),
  ),
];
