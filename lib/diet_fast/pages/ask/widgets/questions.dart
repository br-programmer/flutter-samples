import 'package:flutter/material.dart';
import 'package:flutter_samples/diet_fast/models/ask_model.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  const Questions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Consumer<AskIndex>(builder: (_, askIndex, __) {
        return Column(
          children: asks[askIndex.index]
              .questions
              .map((question) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: Container(
                        key: Key(question),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 6, offset: Offset(0, 3)),
                          ],
                        ),
                        child: Text(
                          question,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
                        )),
                  ))
              .toList(),
        );
      }),
    );
  }
}
