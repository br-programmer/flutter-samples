import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/models/category.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatelessWidget {
  Categories({Key key}) : super(key: key);

  final selected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: AspectRatio(
          aspectRatio: 16 / 4.5,
          child: LayoutBuilder(
            builder: (_, constrains) => ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemCount: categories.length,
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => selected.value = i,
                child: ValueListenableBuilder(
                    valueListenable: selected,
                    builder: (_, value, __) =>
                        _ItemCategories(category: categories[i], constraints: constrains, isSelected: value == i)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemCategories extends StatelessWidget {
  const _ItemCategories({Key key, this.category, this.constraints, this.isSelected}) : super(key: key);
  final bool isSelected;
  final Category category;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: constraints.maxHeight * .65,
            height: constraints.maxHeight * .65,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? EcommerceColors.orange : Colors.white,
              boxShadow: [BoxShadow(blurRadius: 7.5, color: Colors.black.withOpacity(.05))],
            ),
            child: SvgPicture.asset(category.path, color: isSelected ? Colors.white : Color(0xFFB3B3C3)),
          ),
          const SizedBox(height: 10),
          Text(
            category.name,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: isSelected ? EcommerceColors.orange : EcommerceColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}
