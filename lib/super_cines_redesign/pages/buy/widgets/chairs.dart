import 'package:flutter/material.dart';
import 'package:flutter_samples/super_cines_redesign/utils/constans.dart';

class Chairs extends StatelessWidget {
  Chairs({Key key}) : super(key: key);

  final _chairSelected = ValueNotifier<int>(null);

  @override
  Widget build(BuildContext context) {
    int pos = 3;
    int space = 5;
    int aux = 0;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 45, right: 0, top: 15),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: chairsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9, crossAxisSpacing: 12, mainAxisSpacing: 15, childAspectRatio: 1),
          itemBuilder: (_, i) {
            if (i == space) {
              space += 9;
              return IgnorePointer(child: SizedBox.shrink());
            } else {
              double translateX = 0.0;
              Color color = SuperCinesColors.yellow;
              if (pos < i) {
                if (aux <= 3 && aux > 0) {
                  translateX = -25.0;
                  color = SuperCinesColors.colorChair;
                }
                if (aux == 3) {
                  pos += 9;
                  aux = 0;
                } else
                  aux++;
              }
              return ValueListenableBuilder<int>(
                valueListenable: _chairSelected,
                builder: (_, selected, __) => Transform.translate(
                  transformHitTests: false,
                  offset: Offset(translateX, 0),
                  child: GestureDetector(
                    onTap: (chairsList[i] || selected == i) ? null : () => _chairSelected.value = i,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        color: (chairsList[i] || selected == i) ? color : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
