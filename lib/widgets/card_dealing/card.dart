// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';

class CardWidget extends StatefulWidget {
  CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
  }

  // getCardFrontImage returns the asset image for the puzzle card
  Image getCardFrontImage() {
    return Image.asset(
      'assets/images/flipped.png',
      fit: BoxFit.fill,
    );
  }

  // getCardBackImage returns the asset image for the puzzle card back
  Image getCardBackImage() {
    return Image.asset(
      'assets/images/unflipped.png',
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardWidget - build');
    log.info('CardWidget - Building..');

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: getCardBackImage(),
      ),
    );
  }
}
