import 'package:flutter/material.dart';
import 'package:flutter_samples/radio_app/bloc/radio_bloc.dart';
import 'package:flutter_samples/radio_app/models/station.dart';
import 'package:flutter_samples/radio_app/pages/playing/playing.dart';
import 'package:flutter_samples/radio_app/utils/constans.dart';
import 'package:provider/provider.dart';

class ListStation extends StatelessWidget {
  ListStation({Key key}) : super(key: key);

  final _stationSelect = ValueNotifier<int>(0);

  void _goToDetail(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (_) => Playing()));

  @override
  Widget build(BuildContext context) {
    final radioBloc = Provider.of<RadioBLoC>(context, listen: false);
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1, crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: radioBloc.listStations.length,
        itemBuilder: (_, i) => ValueListenableBuilder(
          valueListenable: _stationSelect,
          builder: (context, value, snapshot) {
            final isSelected = i == value;
            final station = radioBloc.listStations[i];
            return ItemStation(
              isSelected: isSelected,
              station: station,
              onTap: () => _stationSelect.value = i,
              onDoubleTap: () {
                if (isSelected) {
                  radioBloc.setStation = station;
                  _goToDetail(context);
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemStation extends StatelessWidget {
  const ItemStation({
    Key key,
    @required this.isSelected,
    @required this.station,
    @required this.onTap,
    @required this.onDoubleTap,
  }) : super(key: key);

  final bool isSelected;
  final Station station;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border.all(color: !isSelected ? Colors.grey.withOpacity(.4) : Colors.transparent, width: 2),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? RadioAppColors.redPurple : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (isSelected)
                  Text(
                    'Playing',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w500),
                  ),
                Spacer(),
                Icon(station.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.white),
              ],
            ),
            Column(
              children: [
                Text(
                  station.frequency.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: isSelected ? Colors.white : Colors.white24, fontWeight: FontWeight.bold),
                ),
                Text(
                  station.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w700, color: isSelected ? Colors.white : Colors.white24),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 16 / 3.75,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
                child: CustomPaint(
                  painter: _StationPainter(isSelected ? Colors.white : Colors.white24, station.color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StationPainter extends CustomPainter {
  _StationPainter(this.color, this.colorDots);
  final Color color;
  final Color colorDots;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width * .01, size.height * .5)
      ..quadraticBezierTo(size.width * .02, size.height * .52, size.width * .04, size.height * .58)
      ..cubicTo(
          size.width * .05, size.height * .62, size.width * .1, size.height * .76, size.width * .13, size.height * .76)
      ..cubicTo(
          size.width * .18, size.height * .76, size.width * .2, size.height * .04, size.width * .25, size.height * .05)
      ..cubicTo(
          size.width * .32, size.height * .05, size.width * .3, size.height * .76, size.width * .38, size.height * .76)
      ..cubicTo(
          size.width * .44, size.height * .76, size.width * .44, size.height * .25, size.width * .5, size.height * .25)
      ..cubicTo(
          size.width * .57, size.height * .25, size.width * .56, size.height * .96, size.width * .63, size.height * .96)
      ..cubicTo(
          size.width * .69, size.height * .96, size.width * .68, size.height * .24, size.width * .75, size.height * .24)
      ..cubicTo(
          size.width * .8, size.height * .25, size.width * .8, size.height * .76, size.width * .88, size.height * .76)
      ..cubicTo(
          size.width * .91, size.height * .77, size.width * .94, size.height * .63, size.width * .96, size.height * .58)
      ..quadraticBezierTo(size.width * .98, size.height * .52, size.width * .99, size.height * .5);

    canvas.drawPath(path, paint);

    paint.color = colorDots;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(Offset(0, size.height / 2), 5, paint);
    canvas.drawCircle(Offset(size.width, size.height / 2), 5, paint);
  }

  @override
  bool shouldRepaint(_StationPainter oldDelegate) => oldDelegate != this;
}
