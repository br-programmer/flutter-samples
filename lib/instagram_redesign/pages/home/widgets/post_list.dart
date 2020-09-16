import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/custom_painter/page_indicator_painter.dart';
import 'package:flutter_samples/instagram_redesign/models/post.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_math/vector_math.dart' as vector show radians;

class PostList extends StatelessWidget {
  const PostList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 5),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, i) => PostItem(post: posts[i]),
          childCount: posts.length,
        ),
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key key, @required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    String countLikes = post.countLikes.toString();
    if (countLikes.length > 3)
      countLikes = '${countLikes.substring(0, 1)},${countLikes.substring(1, countLikes.length)}';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .65,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    post.userPhoto,
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: Theme.of(context).textTheme.button.copyWith(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      post.timeAgo,
                      style: Theme.of(context).textTheme.caption.copyWith(fontSize: 13),
                    ),
                  ],
                ),
                Spacer(),
                Transform.translate(
                  offset: Offset(0, -5),
                  child: Transform.rotate(
                      angle: vector.radians(-45),
                      child: SvgPicture.asset('assets/images/instagram_redesign/send.svg', width: 18)),
                ),
                const SizedBox(width: 15),
                Transform.translate(
                    offset: Offset(0, -5),
                    child: SvgPicture.asset('assets/images/instagram_redesign/more.svg', width: 18)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ImagePost(countLikes: post.countLikes, postImages: post.postImages),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text('Les gusta a ', style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14)),
                    Text('${post.userLike} y $countLikes ', style: Theme.of(context).textTheme.bodyText1),
                    Text('personas más', style: Theme.of(context).textTheme.caption.copyWith(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '${post.postTitle} ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text('Ver los ${post.countComment} comentarios',
                    style: Theme.of(context).textTheme.caption.copyWith(fontSize: 15)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('${post.userComment} ',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Text(
                        post.comment,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImagePost extends StatefulWidget {
  const ImagePost({Key key, @required this.postImages, @required this.countLikes}) : super(key: key);
  final List<String> postImages;
  final int countLikes;

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  PageController _controller;

  final _isFavorite = ValueNotifier<bool>(false);

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String countLikes = widget.countLikes.toString();
    if (countLikes.length > 3)
      countLikes = '${countLikes.substring(0, 1)},${countLikes.substring(1, countLikes.length)}';

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.postImages.length,
              itemBuilder: (_, i) => GestureDetector(
                onDoubleTap: () => _isFavorite.value = !_isFavorite.value,
                child: Image.asset(widget.postImages[i], fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, bottom: 15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: InstagramColors.pink,
                      child: Icon(Icons.favorite, color: InstagramColors.cardLight),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
                      decoration: BoxDecoration(
                        color: Color(0xff868588).withOpacity(.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        countLikes,
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15, bottom: 15),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Theme.of(context).cardColor,
                  child: SvgPicture.asset(
                    'assets/images/instagram_redesign/chat.svg',
                    color: Theme.of(context).textTheme.bodyText1.color,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => CustomPaint(
                    painter: PageIndicatorPainter(
                      pageCount: widget.postImages.length,
                      scrollPosition: (_controller.hasClients && _controller.page != null) ? _controller.page : 0.0,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(.55),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                        '${(_controller.hasClients && _controller.page != null) ? _controller.page.toInt() + 1 : 1}/${widget.postImages.length}'),
                  ),
                ),
              ),
            ),
            // Positioned.fill(
            //   child: ValueListenableBuilder<bool>(
            //     valueListenable: _isFavorite,
            //     builder: (_, value, __) => value
            //         ? Transform.scale(
            //             scale: 1.2,
            //             child: Icon(
            //               Icons.favorite,
            //               color: InstagramColors.cardLight,
            //               size: 80.0,
            //             ),
            //           )
            //         : SizedBox.shrink(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
