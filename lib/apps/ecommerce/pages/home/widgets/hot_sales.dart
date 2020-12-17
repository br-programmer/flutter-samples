import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/ecommerce/bloc/page_view_bloc.dart';
import 'package:flutter_samples/apps/ecommerce/models/phone.dart';
import 'package:flutter_samples/apps/ecommerce/utils/constans.dart';
import 'package:provider/provider.dart';

class HotSales extends StatelessWidget {
  const HotSales({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewBloc = Provider.of<PageViewBLoC>(context);
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: PageView.builder(
                    controller: pageViewBloc.controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: hotSales.length,
                    itemBuilder: (_, i) => Image.asset(hotSales[i].photos.first, fit: BoxFit.cover),
                  ),
                ),
                const _DetailHotSales(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailHotSales extends StatelessWidget {
  const _DetailHotSales({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewBloc = Provider.of<PageViewBLoC>(context);
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: AnimatedBuilder(
          animation: pageViewBloc.controller,
          builder: (_, __) {
            int index = 0;
            if (pageViewBloc.controller.page != null) {
              index = pageViewBloc.controller.page.toInt();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: EcommerceColors.orange,
                  child: Text('New',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 15),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: Column(
                    key: Key(hotSales[index].name),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotSales[index].name,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        hotSales[index].features,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Buy now!',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
