import 'package:flutter/material.dart';
import 'package:flutter_samples/nike_shoes/utils/constans.dart';

class DetailsPerfomance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 13),
              ),
              Container(
                width: 7.5,
                height: 2,
                color: NikeShoesColors.colorGreen,
              )
            ],
          ),
          const SizedBox(width: 35),
          Text(
            'Perfomance',
            style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
