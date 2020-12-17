import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key key, @required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * .1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Space',
              style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Exploration',
              style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames in adipiscing. Ac magna donec egestas habitant.',
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: onTap,
              child: Text(
                'View More',
                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
