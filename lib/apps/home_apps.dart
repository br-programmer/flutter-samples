import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/apps.dart';

class HomeAppsPage extends StatelessWidget {
  void _handlerToPage(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => child));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps Concept - BrProgrammer'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Instagram-Redesign'),
              onPressed: () => _handlerToPage(context, InstagramRedesign()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Nike-Shop'),
              onPressed: () => _handlerToPage(context, NikeShoes()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Smart-Parking'),
              onPressed: () => _handlerToPage(context, SmartParking()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Space-Concept'),
              onPressed: () => _handlerToPage(context, SpaceConcept()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Diet-Fast'),
              onPressed: () => _handlerToPage(context, DietFast()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Super-Cines-Redesign'),
              onPressed: () => _handlerToPage(context, SuperCinesRedesign()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Find-Home'),
              onPressed: () => _handlerToPage(context, FindHome()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Music-App'),
              onPressed: () => _handlerToPage(context, MusicApp()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Ecommerce'),
              onPressed: () => _handlerToPage(context, Ecommerce()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('RadioApp'),
              onPressed: () => _handlerToPage(context, RadioApp()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Salud-Financiera'),
              onPressed: () => _handlerToPage(context, SaludFinaciera()),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('LinkedIn-Redesign'),
              onPressed: () => _handlerToPage(context, LinkedInRedesign()),
            ),
          ],
        ),
      ),
    );
  }
}
