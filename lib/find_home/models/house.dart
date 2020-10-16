import 'package:meta/meta.dart' show required;

class House {
  final String name;
  final List<String> photos;
  final User user;
  final double price;
  final int reviews;
  final int bedroom;
  final int menu;
  final int bathroom;
  final String description;
  final List<String> utilities;
  final bool aviable;

  House({
    @required this.name,
    @required this.photos,
    @required this.user,
    @required this.price,
    @required this.reviews,
    @required this.bedroom,
    @required this.menu,
    @required this.bathroom,
    @required this.description,
    @required this.utilities,
    @required this.aviable,
  });
}

class User {
  final String name;
  final String photo;
  final int rating;
  final String location;

  User({@required this.name, @required this.photo, @required this.rating, @required this.location});
}

final houses = <House>[
  House(
    name: 'Special House Mix',
    photos: [
      'assets/images/find_home/menu-4.jpg',
      'assets/images/find_home/bathroom-4.jpg',
      'assets/images/find_home/home-4.jpg',
      'assets/images/find_home/bedroom-3.jpg',
    ],
    user: User(
      name: 'Mauricio Lopez',
      photo: 'assets/images/instagram_redesign/mao.jpg',
      rating: 3,
      location: 'Zihuatanejo, MX',
    ),
    price: 1500.00,
    reviews: 20,
    bedroom: 2,
    menu: 1,
    bathroom: 1,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus condimentum nulla diam proin quis commodo malesuada. Dolor morbi egestas consectetur egestas aliquam tellus. Accumsan tristique consequat nec cras commodo et orci ipsum, convallis. Lectus nibh ut eget quis quis praesent pellentesque. Molestie a id potenti vivamus blandit aliquet iaculis sed. Amet ut rutrum mauris gravida pellentesque eget in in potenti.',
    utilities: ['Speed wifi', 'Deskspace', 'Safe location'],
    aviable: true,
  ),
  House(
    name: 'Special House',
    photos: [
      'assets/images/find_home/menu-2.jpg',
      'assets/images/find_home/bathroom-2.jpg',
      'assets/images/find_home/home-2.jpg',
      'assets/images/find_home/bedroom-2.jpg',
    ],
    user: User(
      name: 'Zully Cedeño',
      photo: 'assets/images/instagram_redesign/zully.jpg',
      rating: 5,
      location: 'Manta, EC',
    ),
    price: 570.00,
    reviews: 32,
    bedroom: 3,
    menu: 2,
    bathroom: 4,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus condimentum nulla diam proin quis commodo malesuada. Dolor morbi egestas consectetur egestas aliquam tellus. Accumsan tristique consequat nec cras commodo et orci ipsum, convallis. Lectus nibh ut eget quis quis praesent pellentesque. Molestie a id potenti vivamus blandit aliquet iaculis sed. Amet ut rutrum mauris gravida pellentesque eget in in potenti.',
    utilities: ['Wifi', 'Phone', 'Light'],
    aviable: false,
  ),
  House(
      name: 'House Mix',
      photos: [
        'assets/images/find_home/menu-1.jpg',
        'assets/images/find_home/bathroom-1.jpg',
        'assets/images/find_home/home-1/.jpg',
        'assets/images/find_home/bedroom-1.jpg',
      ],
      user: User(
        name: 'Mariana Alava',
        photo: 'assets/images/instagram_redesign/mariana.jpg',
        rating: 4,
        location: 'Manta, EC',
      ),
      price: 5070.00,
      reviews: 12,
      bedroom: 4,
      menu: 1,
      bathroom: 4,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus condimentum nulla diam proin quis commodo malesuada. Dolor morbi egestas consectetur egestas aliquam tellus. Accumsan tristique consequat nec cras commodo et orci ipsum, convallis. Lectus nibh ut eget quis quis praesent pellentesque. Molestie a id potenti vivamus blandit aliquet iaculis sed. Amet ut rutrum mauris gravida pellentesque eget in in potenti.',
      utilities: ['Wifi', 'Phone', 'Light'],
      aviable: true),
  House(
    name: 'Special Mix',
    photos: [
      'assets/images/find_home/menu-3.jpg',
      'assets/images/find_home/bathroom-3.jpg',
      'assets/images/find_home/home-3.jpg',
      'assets/images/find_home/bedroom-3.jpg',
    ],
    user: User(
      name: 'Mauricio Lopez',
      photo: 'assets/images/instagram_redesign/mao.jpg',
      rating: 4,
      location: 'Zihuatanejo, MX',
    ),
    price: 1300.00,
    reviews: 29,
    bedroom: 3,
    menu: 2,
    bathroom: 3,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus condimentum nulla diam proin quis commodo malesuada. Dolor morbi egestas consectetur egestas aliquam tellus. Accumsan tristique consequat nec cras commodo et orci ipsum, convallis. Lectus nibh ut eget quis quis praesent pellentesque. Molestie a id potenti vivamus blandit aliquet iaculis sed. Amet ut rutrum mauris gravida pellentesque eget in in potenti.',
    utilities: ['Speed wifi', 'Water', 'Safe Location'],
    aviable: false,
  ),
];
