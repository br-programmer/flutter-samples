import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/utils/constans.dart';

class QuantityBottonAdd extends StatelessWidget {
  final quantitySelected = ValueNotifier<String>('1');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black38, width: .5))),
            child: Row(
              children: [
                Text('Quantity:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                const SizedBox(width: 10),
                ValueListenableBuilder(
                  valueListenable: quantitySelected,
                  builder: (_, value, __) => DropdownButton(
                    underline: SizedBox(),
                    isDense: true,
                    value: value,
                    dropdownColor: Colors.white,
                    iconSize: 20,
                    icon: Icon(Icons.arrow_drop_down, color: Color(0xff88CE40)),
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Uniwars',
                      fontSize: 13,
                    ),
                    items: quantity.map((value) => DropdownMenuItem<String>(value: value, child: Text(value))).toList(),
                    onChanged: (value) => quantitySelected.value = value,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xff88CE40),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
