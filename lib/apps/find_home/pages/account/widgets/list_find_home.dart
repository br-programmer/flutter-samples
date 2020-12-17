import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_samples/apps/find_home/utils/constans.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ListFindHome extends StatelessWidget {
  const ListFindHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 25),
        child: AspectRatio(
          aspectRatio: 16 / 7.3,
          child: LayoutBuilder(builder: (_, constrains) {
            return ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (_, i) => ItemFindHome(index: i, constrains: constrains),
            );
          }),
        ),
      ),
    );
  }
}

class ItemFindHome extends StatelessWidget {
  const ItemFindHome({Key key, this.index, this.constrains}) : super(key: key);
  final int index;
  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.01)),
          ],
        ),
        padding: EdgeInsets.all(10),
        width: constrains.maxWidth * .75,
        child: Column(
          children: [
            Text(
              'Estadistics',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
            ),
            if (index.isEven) ...[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: 90,
                      progressColor: FindHomeColors.cyan,
                      percent: .4,
                      startAngle: 20,
                      lineWidth: 12,
                      animation: true,
                      animationDuration: 750,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '40',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.bold),
                          ),
                          Text('Level',
                              style: Theme.of(context).textTheme.caption.copyWith(color: FindHomeColors.blueDark)),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Estadist(text: '10 sales \nComplete', icon: FontAwesome.dollar),
                        const SizedBox(height: 10),
                        Estadist(text: '09 clients', icon: FontAwesome.user),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'View more info',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: FindHomeColors.cyan, fontWeight: FontWeight.w500),
              ),
            ] else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Risus condimentum nulla diam proin quis commodo malesuada. Dolor morbi egestas consectetur egestas aliquam tellus. Accumsan tristique consequat nec cras commodo et orci ipsum.',
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class Estadist extends StatelessWidget {
  const Estadist({Key key, this.icon, this.text}) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: FindHomeColors.cyan),
        const SizedBox(width: 10),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: FindHomeColors.blueDark, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
