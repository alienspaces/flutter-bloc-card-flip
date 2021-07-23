import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

Size cardSize(double availableWidth, double availableHeight) {
  double cardWidth = availableWidth.floorToDouble();
  double cardHeight = ((cardWidth / 4) * 7).floorToDouble();
  if (cardHeight > availableHeight) {
    cardHeight = availableHeight.floorToDouble();
    cardWidth = ((cardHeight / 7) * 4).floorToDouble();
  }
  return Size(cardWidth, cardHeight);
}
