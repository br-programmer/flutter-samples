import 'package:meta/meta.dart' show required;

class Post {
  final String userPhoto;
  final String userName;
  final String timeAgo;
  final List<String> postImages;
  final int countLikes;
  final String userLike;
  final String postTitle;
  final int countComment;
  final String userComment;
  final String comment;

  Post({
    @required this.userPhoto,
    @required this.userName,
    @required this.timeAgo,
    @required this.postImages,
    @required this.countLikes,
    @required this.userLike,
    @required this.postTitle,
    @required this.countComment,
    @required this.userComment,
    @required this.comment,
  });
}

final posts = <Post>[
  Post(
    userPhoto: 'assets/images/instagram_redesign/mao.jpg',
    userName: 'Maoo.lopez',
    timeAgo: 'Hace 2 min',
    postImages: [
      'assets/images/instagram_redesign/post_mao1.jpg',
      'assets/images/instagram_redesign/post_mao2.jpg',
      'assets/images/instagram_redesign/post_mao3.jpg',
    ],
    countLikes: 4588,
    userLike: 'danieldelax',
    postTitle: 'SACRIFICE | VIRUS this photomanipulation inspired in the virus',
    countComment: 500,
    userComment: 'Perla_Pipol',
    comment: 'Esta edición está super genial, que pro!!',
  ),
  Post(
    userPhoto: 'assets/images/instagram_redesign/arturo.jpg',
    userName: 'arturoislasallende',
    timeAgo: 'Hace 8 min',
    postImages: [
      'assets/images/instagram_redesign/post_arturo1.jpg',
      'assets/images/instagram_redesign/post_arturo2.jpg',
      'assets/images/instagram_redesign/post_arturo3.jpg',
      'assets/images/instagram_redesign/post_arturo4.jpg',
      'assets/images/instagram_redesign/post_arturo5.jpg',
      'assets/images/instagram_redesign/post_arturo6.jpg',
    ],
    countLikes: 10208,
    userLike: 'emiliapro24',
    postTitle: 'OWLMODE la naturaleza no pueden regresar a la vida salvaje.',
    countComment: 2596,
    userComment: 'melanniegonmar',
    comment: 'Increíble 😍',
  ),
  Post(
    userPhoto: 'assets/images/instagram_redesign/mica.jpg',
    userName: 'micaela_mendoza2002',
    timeAgo: 'Hace 14 min',
    postImages: [
      'assets/images/instagram_redesign/post_mica1.jpg',
      'assets/images/instagram_redesign/post_mica2.jpg',
      'assets/images/instagram_redesign/post_mica3.jpg',
      'assets/images/instagram_redesign/post_mica4.jpg',
      'assets/images/instagram_redesign/post_mica5.jpg',
      'assets/images/instagram_redesign/post_mica6.jpg',
    ],
    countLikes: 3415,
    userLike: 'yelitza_kerly',
    postTitle: '10 añitos de amistad',
    countComment: 125,
    userComment: 'mariabelenrea_',
    comment: 'Espero seguir muchos más años junto a ti, te amo ❤️😻',
  ),
  Post(
    userPhoto: 'assets/images/instagram_redesign/parejas.jpg',
    userName: 'iesparejas',
    timeAgo: 'Hace 32 min',
    postImages: [
      'assets/images/instagram_redesign/post_parejas1.jpg',
      'assets/images/instagram_redesign/post_parejas2.jpg',
      'assets/images/instagram_redesign/post_parejas3.jpg',
    ],
    countLikes: 699,
    userLike: 'randolphotero711',
    postTitle: 'CHICO - CHICA Menciona a tu amor 😍👇',
    countComment: 96,
    userComment: 'lorena_vargasc',
    comment: '@ssaamuuell ❤️',
  ),
  Post(
    userPhoto: 'assets/images/instagram_redesign/mariana.jpg',
    userName: 'marianaalavad',
    timeAgo: 'Hace 56 min',
    postImages: [
      'assets/images/instagram_redesign/post_mari3.jpg',
      'assets/images/instagram_redesign/post_mari1.jpg',
      'assets/images/instagram_redesign/post_mari2.jpg',
    ],
    countLikes: 4588,
    userLike: 'brangy_c',
    postTitle: 'SUEÑA Y VIVE si puedes soñarlo ¡PUEDES HACERLO!',
    countComment: 619,
    userComment: 'priscilacedeno15',
    comment: 'LA MEJOR DE TODAS!!! 😍 La próxima Reina de Manta 👸🏻',
  ),
];
