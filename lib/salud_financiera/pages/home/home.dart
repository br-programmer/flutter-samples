import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/bloc/home_bloc.dart';
import 'package:flutter_samples/salud_financiera/pages/home/widgets/widgets.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SaludFinacieraColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const MyCustomAppBar(),
                Expanded(
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      const CurrentHealth(),
                      const HeaderList(),
                      const DetaildSelected(),
                      const SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight * 1.5)),
                    ],
                  ),
                )
              ],
            ),
          ),
          MyCustomButtomNavigation(),
        ],
      ),
    );
  }
}

class DetaildSelected extends StatelessWidget {
  const DetaildSelected({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<HomeStatus>(
      valueListenable: homeBloc.status,
      builder: (_, status, __) => (status == HomeStatus.movement) ? ListMovement() : ListStadistic(),
    );
  }
}
