import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/diet_fast/models/ask_model.dart';
import 'package:flutter_samples/apps/diet_fast/pages/home/home.dart';
import 'package:flutter_samples/apps/diet_fast/utils/constan.dart';
import 'package:provider/provider.dart';

class IndexAndNext extends StatelessWidget {
  const IndexAndNext({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Consumer<AskIndex>(builder: (_, askIndex, __) {
        int index = askIndex.index;
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${index + 1}/4 steps',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    onPressed: () => (index < asks.length - 1)
                        ? askIndex.index = index + 1
                        : Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home())),
                    padding: EdgeInsets.zero,
                    pressedOpacity: .75,
                    child: CircleAvatar(
                      backgroundColor: DietFastColors.buttonColor,
                      radius: 30,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 35),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                (index < asks.length - 1) ? 'Next' : 'Done',
                style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
              ),
            ),
          ],
        );
      }),
    );
  }
}
