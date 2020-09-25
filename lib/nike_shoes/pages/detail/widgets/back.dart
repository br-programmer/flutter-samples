import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
          Text('Back', style: TextStyle(fontFamily: 'Orbitron', fontWeight: FontWeight.w400, fontSize: 17)),
        ],
      ),
    );
  }
}
