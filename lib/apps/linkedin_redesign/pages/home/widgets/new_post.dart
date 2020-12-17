import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/linkedin_redesign/models/new_post.dart';
import 'package:flutter_samples/apps/linkedin_redesign/utils/linkedin_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: LinkedInColors.white),
          child: Column(
            children: [
              const _NewPostInput(),
              Divider(height: 0, thickness: 1, color: Colors.black12),
              const _NewPostOptions(),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewPostOptions extends StatelessWidget {
  const _NewPostOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: newPostItems
            .map(
              (e) => Row(
                children: [
                  SvgPicture.asset(e.path),
                  const SizedBox(width: 5),
                  Text(e.name,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontWeight: FontWeight.w600, color: Colors.black45)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _NewPostInput extends StatelessWidget {
  const _NewPostInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/linkedin/icons/new_post.svg'),
          Expanded(
            child: CupertinoTextField(
              placeholder: 'What on your mind?',
              padding: EdgeInsets.only(left: 10),
              maxLines: 3,
              minLines: 1,
              placeholderStyle: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black45),
              style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.black87),
              decoration: BoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}
