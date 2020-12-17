import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/widgets/widgets.dart' show Price;
import 'package:flutter_samples/apps/nike_shoes/pages/detail/widgets/widgets.dart'
    show DetailsPerfomance, DescriptionShoe, SizesShoe, QuantityBottonAdd;

class DetailBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DetailsPerfomance(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Nike XTM',
                        style: TextStyle(
                            fontFamily: 'Orbitron', fontSize: 31, fontWeight: FontWeight.w500, color: Colors.black87)),
                  ),
                  Price(isDetail: true),
                  DescriptionShoe(),
                  SizesShoe(),
                ],
              ),
            ),
            QuantityBottonAdd(),
          ],
        ),
      ),
    );
  }
}
