import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Icon(Icons.apps),
                  SizedBox(width: 20),
                  Text(
                    'Sport Shoes',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Orbitron',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xff25282F),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_border, size: 20),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: NikeShoesColors.colorGreen,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 70),
              Text(
                'Nike XTM',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'new #19 model',
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: NikeShoesColors.colorGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
