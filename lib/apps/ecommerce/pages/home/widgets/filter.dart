import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:flutter_samples/apps/ecommerce/widgets/buttom_round.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Filter extends StatelessWidget {
  const Filter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 7.5)],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FilterHeader(),
            const SizedBox(height: 40),
            _Select(list: brand, text: 'Brand'),
            const SizedBox(height: 15),
            _Select(list: price, text: 'Price'),
            const SizedBox(height: 15),
            _Select(list: size, text: 'Size'),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class _Select extends StatelessWidget {
  _Select({Key key, this.text, this.list}) : super(key: key);

  final String text;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    final _select = ValueNotifier<String>(list[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _select,
                  builder: (_, value, __) => DropdownButton(
                    value: value,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.w400),
                    icon: SizedBox.shrink(),
                    isDense: true,
                    underline: SizedBox.shrink(),
                    items: list.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
                    onChanged: (value) => _select.value = value,
                  ),
                ),
              ),
              SvgPicture.asset('assets/images/ecommerce/arrow.svg', width: 15),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterHeader extends StatelessWidget {
  const _FilterHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ButtomRound(),
        ),
        Align(
          child: Text(
            'Filter options',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: EcommerceColors.backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(color: EcommerceColors.orange, borderRadius: BorderRadius.circular(7.5)),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Done',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      wordSpacing: 2,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
