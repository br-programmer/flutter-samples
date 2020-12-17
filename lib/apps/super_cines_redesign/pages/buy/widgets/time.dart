import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/super_cines_redesign/models/movie.dart';
import 'package:flutter_samples/apps/super_cines_redesign/models/movie_bloc.dart';
import 'package:flutter_samples/apps/super_cines_redesign/utils/constans.dart';
import 'package:provider/provider.dart';

class Time extends StatelessWidget {
  Time({Key key}) : super(key: key);

  final _indexSelected = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final selected = Provider.of<MovieBLoC>(context, listen: false).movieSelected.value;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: AspectRatio(
        aspectRatio: 16 / 2.5,
        child: ValueListenableBuilder<int>(
          valueListenable: _indexSelected,
          builder: (_, indexSelected, __) => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: movies[selected].hora.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 15),
            itemBuilder: (_, i) => GestureDetector(
                onTap: () => _indexSelected.value = i,
                child: ItemTime(time: movies[selected].hora[i], isSelected: i == indexSelected)),
          ),
        ),
      ),
    );
  }
}

class ItemTime extends StatelessWidget {
  const ItemTime({Key key, @required this.time, @required this.isSelected}) : super(key: key);

  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? SuperCinesColors.yellow : Colors.grey, width: 2),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: isSelected ? SuperCinesColors.yellow : Colors.grey, fontWeight: FontWeight.bold),
          ),
          Text(
            'FROM \$3,75',
            style: Theme.of(context).textTheme.button.copyWith(
                color: isSelected ? SuperCinesColors.yellow.withOpacity(.5) : Colors.grey, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
