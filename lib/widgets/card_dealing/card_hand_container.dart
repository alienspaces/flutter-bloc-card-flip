import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_hand.dart';

// The card board lays out a board of cards
class CardHandContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardHandContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardHandContainerWidgetState createState() => _CardHandContainerWidgetState();
}

class _CardHandContainerWidgetState extends State<CardHandContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardHandWidget - build');
    log.info('CardHandContainerWidget- Building..');

    Widget _buildContent() {
      log.info(
        'CardHandContainerWidget- Board width ${widget.boardDimensions.width} height ${widget.boardDimensions.height}',
      );
      log.info(
        'CardHandContainerWidget- Card width ${widget.cardDimensions.width} height ${widget.cardDimensions.height}',
      );
      return Container(
        child: CardHandWidget(),
      );
    }

    return BlocProvider(
      create: (context) => CardDeckCubit(LocalCardRepository(), 10),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: widget.boardDimensions.width / 3,
            width: widget.cardDimensions.width,
            height: widget.cardDimensions.height,
            child: _buildContent(),
          ),
        ],
      ),
    );
  }
}
