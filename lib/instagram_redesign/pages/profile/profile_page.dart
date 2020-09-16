import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/models/history.dart';
import 'package:flutter_samples/instagram_redesign/pages/profile/widgets/widgets.dart';
import 'package:flutter_samples/instagram_redesign/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderProfile(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                Histories(histories: historiesDestacas, isDestacadas: true),
                SelectCategory(),
                MyPost(),
                const SliverToBoxAdapter(child: const SizedBox(height: 90)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
