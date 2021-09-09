import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/logger.dart';
import 'package:flutter_bloc_exploration/cubit/card_deck/card_deck_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/widgets/card_dealing/card_deck_dealing.dart';

// The card board lays out a board of cards
class CardDeckDealingContainerWidget extends StatefulWidget {
  final Size boardDimensions;
  final Size cardDimensions;

  CardDeckDealingContainerWidget({required this.boardDimensions, required this.cardDimensions});

  @override
  _CardDeckDealingContainerWidgetState createState() => _CardDeckDealingContainerWidgetState();
}

class _CardDeckDealingContainerWidgetState extends State<CardDeckDealingContainerWidget> {
  @override
  Widget build(BuildContext context) {
    final log = getLogger('CardDeckWidget - build');
    log.info('Building..');

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          Widget _buildContent() {
            // TODO: Determine when there are no cards..
            return Container(
              child: CardDeckDealingWidget(
                cardDimensions: widget.cardDimensions,
              ),
            );
          }

          return BlocProvider(
            create: (context) => CardDeckCubit(LocalCardRepository(), 10),
            child: Container(
              width: widget.boardDimensions.width,
              height: widget.boardDimensions.height,
              child: _buildContent(),
            ),
          );
        },
      ),
    );
  }
}
