import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/models/history.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';

class Histories extends StatelessWidget {
  const Histories({Key key, @required this.histories, this.isDestacadas = false}) : super(key: key);
  final List<History> histories;
  final bool isDestacadas;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 100,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemCount: histories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => ItemHistory(isFirst: i == 0, history: histories[i], isDestacadas: isDestacadas),
          ),
        ),
      ),
    );
  }
}

class ItemHistory extends StatelessWidget {
  const ItemHistory({Key key, this.isFirst = false, this.history, this.isDestacadas}) : super(key: key);
  final bool isFirst;
  final bool isDestacadas;
  final History history;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 85,
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isFirst ? Theme.of(context).accentColor : null,
                      gradient: !isFirst
                          ? LinearGradient(
                              colors: [InstagramColors.pink, InstagramColors.purple],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                          : null,
                    ),
                    padding: EdgeInsets.all(2),
                    child: ClipOval(
                      child: Image.asset(history.image, fit: BoxFit.cover),
                    ),
                  ),
                  if (isFirst)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: -13,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Theme.of(context).accentColor,
                        child: Container(
                          alignment: Alignment.center,
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [InstagramColors.pink, InstagramColors.purple],
                              stops: [.3, 1],
                            ),
                          ),
                          child: Icon(Icons.add, size: 18),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                history.title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontWeight: FontWeight.w300,
                      color: isDestacadas ? Theme.of(context).hintColor : null,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
