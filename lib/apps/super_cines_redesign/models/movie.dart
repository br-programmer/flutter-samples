import 'package:meta/meta.dart' show required;

class Movie {
  final String title;
  final String subtitle;
  final String poster;
  final String image;
  final String authors;
  final List<String> hora;
  final int anio;
  final String gender;

  Movie({
    @required this.title,
    @required this.subtitle,
    @required this.poster,
    @required this.image,
    @required this.authors,
    @required this.hora,
    @required this.anio,
    @required this.gender,
  });
}

final movies = <Movie>[
  Movie(
    title: "Charlie'S Angels",
    subtitle: 'Clean energy',
    poster: 'assets/images/supercines/charlies-poster.png',
    image: 'assets/images/supercines/charlies.png',
    authors: 'Kristen Stewart, Naomi Scott, Elizabeth',
    hora: ['17:25', '19:55', '20:45', '22:50'],
    anio: 2019,
    gender: 'Acción, Comedia',
  ),
  Movie(
    title: 'Avenger End Game',
    subtitle: 'End Game',
    poster: 'assets/images/supercines/avenger-poster.png',
    image: 'assets/images/supercines/avenger.png',
    authors: 'Robert Jr, Chris Evans, Paul Rudd',
    hora: ['14:30', '16:36', '17:25', '21:25', '22:10'],
    anio: 2019,
    gender: 'Acción, Ciencia ficción',
  ),
  Movie(
    title: 'Jumanji',
    subtitle: 'The Next Level',
    poster: 'assets/images/supercines/jumanji-poster.png',
    image: 'assets/images/supercines/jumanji.png',
    authors: 'Dwayne Johnson, Jack Black, Karen Gillian',
    hora: ['16:15', '17:45', '19:45', '21:00', '22:40'],
    anio: 2019,
    gender: 'Adventure, Games, Travelers',
  ),
  Movie(
    title: "Start Wars",
    subtitle: 'Episodio IX',
    poster: 'assets/images/supercines/star-wars-poster.png',
    image: 'assets/images/supercines/star-wars.png',
    authors: 'Daisy Ridley, John Boyega, Oscar Isaac',
    hora: ['13:55', '16:40', '18:20', '20:15', '21:25'],
    anio: 2018,
    gender: 'Ciencia ficción, Acción',
  ),
  Movie(
    title: "Joker",
    subtitle: 'Guasón',
    poster: 'assets/images/supercines/joker-poster.png',
    image: 'assets/images/supercines/joker.png',
    authors: 'Joaquin Phoenix, Zazie Beetz,Brett Cullen',
    hora: ['15:30', '16:20', '17:25', '19:55', '22:20'],
    anio: 2019,
    gender: 'Crimen, Drama',
  ),
];
