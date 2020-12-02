import 'package:flutter/material.dart';
import 'package:flutter_samples/linkedin_redesign/models/post.dart';
import 'package:flutter_samples/linkedin_redesign/utils/linkedin_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListPost extends StatelessWidget {
  const ListPost({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((_, i) => _ItemPost(post: posts[i]), childCount: posts.length),
      ),
    );
  }
}

class _ItemPost extends StatelessWidget {
  const _ItemPost({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(color: LinkedInColors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [_HeaderPost(post: post), Image.asset(post.photo, fit: BoxFit.cover), _FooterPost(post: post)],
        ),
      ),
    );
  }
}

class _HeaderPost extends StatelessWidget {
  const _HeaderPost({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final description = post.description.split(' ');
    final styleDescription =
        Theme.of(context).textTheme.subtitle2.copyWith(color: Color(0xFF107CB6), fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 20, backgroundColor: Colors.transparent, backgroundImage: AssetImage(post.user.photo)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              post.user.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(color: Colors.black.withOpacity(.6), fontWeight: FontWeight.w700),
                            ),
                            Text('${post.title} ${post.timeAgo}',
                                style: Theme.of(context).textTheme.button.copyWith(color: Colors.black54))
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.more_horiz),
                  ],
                ),
                const SizedBox(height: 10),
                RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: '${description[0]} ',
                    style: styleDescription,
                    children: [
                      TextSpan(
                          text: description.sublist(1, description.length).join(' '),
                          style: styleDescription.copyWith(
                            color: Colors.black.withOpacity(.7),
                            fontWeight: FontWeight.w500,
                          ))
                    ],
                  ),
                ),
                // Text(
                //   post.description,
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                //   style: Theme.of(context)
                //       .textTheme
                //       .subtitle2
                //       .copyWith(color: Colors.black.withOpacity(.7), fontWeight: FontWeight.w500),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterPost extends StatelessWidget {
  const _FooterPost({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ItemFooterPost(
              path: 'assets/linkedin/icons/like.svg',
              text: '${post.like > 99 ? '100+' : post.like}',
              isLike: post.isLikeMe),
          _ItemFooterPost(
              path: 'assets/linkedin/icons/comment.svg', text: '${post.comment > 499 ? '500+' : post.comment}'),
          _ItemFooterPost(path: 'assets/linkedin/icons/share.svg', text: 'Share'),
          _ItemFooterPost(path: 'assets/linkedin/icons/send.svg', text: 'Send'),
        ],
      ),
    );
  }
}

class _ItemFooterPost extends StatelessWidget {
  const _ItemFooterPost({Key key, this.text, this.path, this.isLike = false}) : super(key: key);

  final String text;
  final String path;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(path, color: isLike ? LinkedInColors.cyan : Colors.black38),
        const SizedBox(width: 5),
        Text(text,
            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black38, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
