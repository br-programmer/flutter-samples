import 'package:flutter/material.dart';

class DetailPlanet extends StatelessWidget {
  const DetailPlanet({Key key, @required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final myStyle = Theme.of(context).textTheme.headline3.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Earth', style: myStyle),
          Text('Planet', style: myStyle.copyWith(fontWeight: FontWeight.w400)),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * .65,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Habitant sem ut sit fames.',
              style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  'View more',
                  style: Theme.of(context).textTheme.button.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios, size: 15, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: kBottomNavigationBarHeight + 20),
        ],
      ),
    );
  }
}
