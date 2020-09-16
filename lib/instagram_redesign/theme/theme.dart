import 'package:flutter/material.dart';
import 'package:flutter_samples/instagram_redesign/utils/constant.dart';

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: InstagramColors.scaffoldDark,
  accentColor: InstagramColors.cardLight,
  cardColor: InstagramColors.cardDark,
  canvasColor: InstagramColors.cardLight,
  dividerColor: InstagramColors.categoryDark,
  hintColor: InstagramColors.cardLight,
  brightness: Brightness.light,
);

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: InstagramColors.scaffoldLigth,
  accentColor: InstagramColors.grey,
  cardColor: InstagramColors.cardLight,
  canvasColor: InstagramColors.pink,
  dividerColor: InstagramColors.categoryLight,
  hintColor: InstagramColors.colorHistoryLight,
  brightness: Brightness.dark,
);
