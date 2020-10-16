import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/diet.dart';

class ListViewDiet extends StatefulWidget {
  const ListViewDiet({Key key, @required this.selected}) : super(key: key);

  final ValueChanged<int> selected;

  @override
  _ListViewDietState createState() => _ListViewDietState();
}

class _ListViewDietState extends State<ListViewDiet> {
  PageController _pageController;
  int currentPage = 1;

  @override
  void initState() {
    _pageController = PageController(initialPage: 1, viewportFraction: .65);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 15,
        child: LayoutBuilder(
          builder: (_, constrains) => PageView.builder(
            controller: _pageController,
            itemCount: listDiet.length,
            onPageChanged: (value) => setState(() => currentPage = value),
            itemBuilder: (_, i) {
              final diet = listDiet[i];
              return GestureDetector(
                onTap: () => widget.selected(i),
                child: ItemListDiet(currentPage: currentPage == i, diet: diet, constrains: constrains),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemListDiet extends StatelessWidget {
  const ItemListDiet({
    Key key,
    @required this.currentPage,
    @required this.diet,
    @required this.constrains,
  }) : super(key: key);

  final bool currentPage;
  final Diet diet;
  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              width: double.infinity,
              height: currentPage ? constrains.maxHeight * .78 : constrains.maxHeight * .6,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 15)],
              ),
              child: Image.asset(diet.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              diet.title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: currentPage ? Colors.black : Colors.black45,
                  fontWeight: currentPage ? FontWeight.bold : FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
