import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .2),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.withOpacity(.3), borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.white, size: 15),
            const SizedBox(width: 10),
            Expanded(
              child: Text('Search your favorite planet',
                  style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
