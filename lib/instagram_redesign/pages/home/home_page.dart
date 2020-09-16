import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/models/history.dart';
import 'package:flutter_samples/instagram_redesign/pages/home/widgets/widgets.dart' show Explore, PostList;
import 'package:flutter_samples/instagram_redesign/widgets/widgets.dart' show MyCustomAppBar, Histories;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            const MyCustomAppBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  Histories(histories: histories),
                  const Explore(),
                  const PostList(),
                  const SliverToBoxAdapter(child: const SizedBox(height: 90)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
