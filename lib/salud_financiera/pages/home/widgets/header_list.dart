import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/salud_financiera/bloc/home_bloc.dart';
import 'package:flutter_samples/salud_financiera/utils/constans.dart';
import 'package:flutter_samples/widgets/sliver_header_delegate.dart';
import 'package:provider/provider.dart';

class HeaderList extends StatelessWidget {
  const HeaderList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverCustomHeaderDelegate(
        minHeight: 105,
        maxHeight: 105,
        child: Container(
          color: SaludFinacieraColors.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _ItemSelect(),
              const _ItemSelected(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemSelect extends StatelessWidget {
  const _ItemSelect({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
      child: Row(
        children: itemsHeader
            .map(
              (e) => ValueListenableBuilder(
                valueListenable: homeBloc.indextSelected,
                builder: (_, index, __) {
                  final i = itemsHeader.indexOf(e);
                  final isSelected = index == i;
                  return Expanded(
                    child: CupertinoButton(
                      pressedOpacity: .8,
                      onPressed: () => homeBloc.indexSelected = i,
                      padding: EdgeInsets.zero,
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: isSelected ? SaludFinacieraColors.blue : Colors.black26,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ItemSelected extends StatelessWidget {
  const _ItemSelected({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeBLoC>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: ValueListenableBuilder<HomeStatus>(
              valueListenable: homeBloc.status,
              builder: (_, status, __) => Text(
                (status == HomeStatus.movement) ? 'Movimientos realizados' : 'Estadisticas',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: SaludFinacieraColors.blue, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 17.5, color: Color(0xFF8C92BB)),
        ],
      ),
    );
  }
}
