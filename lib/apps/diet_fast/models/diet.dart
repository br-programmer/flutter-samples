import 'package:meta/meta.dart' show required;

class Diet {
  final String image;
  final String title;
  final String description;
  final List<Nutrition> nutritions;
  final List<Ingredient> ingredients;
  final List<String> preparation;

  Diet({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.nutritions,
    @required this.ingredients,
    @required this.preparation,
  });
}

class Nutrition {
  final String quantity;
  final String name;
  Nutrition({@required this.quantity, @required this.name});
}

class Ingredient {
  final String image;
  final String name;
  Ingredient({@required this.image, @required this.name});
}

final listDiet = <Diet>[
  Diet(
    image: 'assets/images/diet_fast/breack-fast2.png',
    title: 'Yogurt with fruits',
    description:
        'Quisque sit amet sagittis erat. Duis pharetra ornare venenatis. Nulla maximus porta velit ut molestie. Proin quis convallis mauris. In facilisis justo at mi pharetra lobortis',
    nutritions: [
      Nutrition(quantity: '243', name: 'calorias'),
      Nutrition(quantity: '2,8g', name: 'grasas'),
      Nutrition(quantity: '45,7g', name: 'carbohid.'),
      Nutrition(quantity: '9,8g', name: 'proteinas'),
    ],
    ingredients: [
      Ingredient(image: 'assets/images/diet_fast/ingredient.png', name: 'Kiwi'),
      Ingredient(image: 'assets/images/diet_fast/ingredient1.png', name: 'Yogurt'),
      Ingredient(image: 'assets/images/diet_fast/ingredient2.png', name: 'Cherry'),
      Ingredient(image: 'assets/images/diet_fast/ingredient3.png', name: 'BlueBerry'),
    ],
    preparation: [],
  ),
  Diet(
    image: 'assets/images/diet_fast/breack-fast.png',
    title: 'Yogurt with fruits',
    description:
        'Quisque sit amet sagittis erat. Duis pharetra ornare venenatis. Nulla maximus porta velit ut molestie. Proin quis convallis mauris. In facilisis justo at mi pharetra lobortis',
    nutritions: [
      Nutrition(quantity: '243', name: 'calorias'),
      Nutrition(quantity: '2,8g', name: 'grasas'),
      Nutrition(quantity: '45,7g', name: 'carbohid.'),
      Nutrition(quantity: '9,8g', name: 'proteinas'),
    ],
    ingredients: [
      Ingredient(image: 'assets/images/diet_fast/ingredient.png', name: 'Kiwi'),
      Ingredient(image: 'assets/images/diet_fast/ingredient1.png', name: 'Yogurt'),
      Ingredient(image: 'assets/images/diet_fast/ingredient2.png', name: 'Cherry'),
      Ingredient(image: 'assets/images/diet_fast/ingredient3.png', name: 'BlueBerry'),
    ],
    preparation: [],
  ),
  Diet(
    image: 'assets/images/diet_fast/breack-fast1.png',
    title: 'Yogurt with fruits',
    description:
        'Quisque sit amet sagittis erat. Duis pharetra ornare venenatis. Nulla maximus porta velit ut molestie. Proin quis convallis mauris. In facilisis justo at mi pharetra lobortis',
    nutritions: [
      Nutrition(quantity: '243', name: 'calorias'),
      Nutrition(quantity: '2,8g', name: 'grasas'),
      Nutrition(quantity: '45,7g', name: 'carbohid.'),
      Nutrition(quantity: '9,8g', name: 'proteinas'),
    ],
    ingredients: [
      Ingredient(image: 'assets/images/diet_fast/ingredient.png', name: 'Kiwi'),
      Ingredient(image: 'assets/images/diet_fast/ingredient1.png', name: 'Yogurt'),
      Ingredient(image: 'assets/images/diet_fast/ingredient2.png', name: 'Cherry'),
      Ingredient(image: 'assets/images/diet_fast/ingredient3.png', name: 'BlueBerry'),
    ],
    preparation: [],
  ),
];
