import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/diet.dart';

class InfoDetaild extends StatelessWidget {
  const InfoDetaild({Key key, @required this.diet}) : super(key: key);
  final Diet diet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  diet.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  diet.description,
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    NutritionalIngredientPreparation(
                        text: 'Nutritional information', isFirt: true, nutrition: diet.nutritions),
                    NutritionalIngredientPreparation(text: 'Ingredient', ingredient: diet.ingredients),
                    NutritionalIngredientPreparation(text: 'Preparation'),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: kBottomNavigationBarHeight * 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class NutritionalIngredientPreparation extends StatelessWidget {
  const NutritionalIngredientPreparation({
    Key key,
    @required this.text,
    this.isFirt = false,
    this.nutrition,
    this.ingredient,
    this.preparation,
  }) : super(key: key);
  final String text;
  final bool isFirt;
  final List<Nutrition> nutrition;
  final List<Ingredient> ingredient;
  final List<String> preparation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 5, offset: Offset(0, 5))],
        ),
        child: Column(
          children: [
            Text(
              text,
              style:
                  Theme.of(context).textTheme.button.copyWith(fontWeight: isFirt ? FontWeight.w400 : FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: (nutrition != null) ? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceEvenly,
              children: (nutrition != null || ingredient != null)
                  ? List.generate(
                      (nutrition != null) ? nutrition.length : ingredient.length,
                      (index) => Column(
                        children: [
                          (nutrition != null)
                              ? Text(
                                  nutrition[index].quantity,
                                  style: Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold, color: (index == 0 ? Colors.red : Colors.black)),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(ingredient[index].image), fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                          Text(
                            (nutrition != null) ? nutrition[index].name : ingredient[index].name,
                            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  : List.generate(
                      4,
                      (index) => Column(
                        children: [
                          Text(
                            '$index',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          Text(
                            'XXXXXX',
                            style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
