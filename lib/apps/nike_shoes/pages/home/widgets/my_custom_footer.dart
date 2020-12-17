import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/nike_shoes/pages/detail/nike_shoes_detail.dart';
import 'package:flutter_samples/apps/nike_shoes/utils/constans.dart';
import 'package:flutter_samples/apps/nike_shoes/widgets/widgets.dart' show Price;

class MyCustomFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Price(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  void _handlerToDetail(BuildContext context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => NikeShoesDetail()));

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          onPressed: () => _handlerToDetail(context),
          padding: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              'view details',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Spacer(),
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff16191E).withOpacity(.45),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: NikeShoesColors.colorGreen, width: 1.5),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
