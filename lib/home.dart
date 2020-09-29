import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/instagram_redesign.dart';
import 'package:flutter_samples/nike_shoes/nicke_shoes.dart';
import 'package:flutter_samples/smart_parking/smart_parging.dart';
import 'package:flutter_samples/space_concept/space_concept.dart';

class HomePage extends StatelessWidget {
  void _handlerToPage(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => child));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Examples - BrProgrammer')),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: Text('Instagram Redesign'),
                onPressed: () => _handlerToPage(context, InstagramRedesign()),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: Text('Nike Shop'),
                onPressed: () => _handlerToPage(context, NikeShoes()),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: Text('Smart Parking'),
                onPressed: () => _handlerToPage(context, SmartParking()),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: Theme.of(context).primaryColor,
                child: Text('Space Concept'),
                onPressed: () => _handlerToPage(context, SpaceConcept()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
