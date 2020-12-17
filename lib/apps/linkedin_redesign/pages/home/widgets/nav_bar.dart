import 'package:flutter/material.dart';
import 'package:flutter_samples/apps/linkedin_redesign/bloc/home_bloc.dart';
import 'package:flutter_samples/apps/linkedin_redesign/utils/constans.dart';
import 'package:flutter_samples/apps/linkedin_redesign/utils/linkedin_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBLoC>(context, listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: bloc.show,
      builder: (_, value, __) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: 0,
          right: 0,
          bottom: value ? 0 : -kToolbarHeight * 1.25,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: kToolbarHeight,
              decoration: BoxDecoration(color: LinkedInColors.white, borderRadius: BorderRadius.circular(12)),
              child: ValueListenableBuilder<int>(
                valueListenable: bloc.index,
                builder: (_, value, __) {
                  return Row(
                    children: List.generate(
                      itemsNavBar.length,
                      (index) {
                        if (index == 2) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(7.5),
                              child: GestureDetector(
                                onTap: () => bloc.setIndex(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: LinkedInColors.cyan,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                            color: LinkedInColors.cyan.withOpacity(.5),
                                            blurRadius: 7.5,
                                            offset: Offset(0, 7.5))
                                      ]),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(itemsNavBar[index], width: 15, color: Colors.white),
                                ),
                              ),
                            ),
                            flex: 2,
                          );
                        } else {
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => bloc.setIndex(index),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(itemsNavBar[index], width: 25),
                                  if (value == index)
                                    Padding(
                                        padding: const EdgeInsets.only(top: 2.5),
                                        child: CircleAvatar(radius: 2.5, backgroundColor: LinkedInColors.cyan))
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
