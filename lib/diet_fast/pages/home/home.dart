import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/diet.dart';
import 'package:flutter_samples/diet_fast/pages/home/detail/detail.dart';
import 'package:flutter_samples/diet_fast/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/diet_fast/utils/constan.dart';

class Home extends StatelessWidget {
  final isDetail = ValueNotifier<bool>(false);
  final index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DietFastColors.background,
      body: AnimatedBuilder(
        animation: Listenable.merge([isDetail, index]),
        builder: (_, __) => Stack(
          children: [
            Positioned.fill(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: isDetail.value
                    ? Detaild(key: Key('detaild'), diet: listDiet[index.value], onTap: () => isDetail.value = false)
                    : HomeConten(
                        key: Key('home'),
                        selected: (value) {
                          index.value = value;
                          isDetail.value = true;
                        },
                      ),
              ),
            ),
            Header(),
            MyButtonNavigation(),
          ],
        ),
      ),
    );
  }
}

class HomeConten extends StatelessWidget {
  const HomeConten({Key key, @required this.selected}) : super(key: key);
  final ValueChanged<int> selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kToolbarHeight * 1.65),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          const Activity(),
          const ResultsInformation(),
          SelectDiet(),
          ListViewDiet(selected: selected),
          const SliverToBoxAdapter(child: SizedBox(height: kBottomNavigationBarHeight * 1.75)),
        ],
      ),
    );
  }
}
