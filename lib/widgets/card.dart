import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/flip_card.dart';
import 'package:flutter_bloc_exploration/widgets/flip_card_button.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';
import 'package:flutter_bloc_exploration/data/card_repository.dart';
import 'package:flutter_bloc_exploration/size.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardCubit(FakeCardRepository()),
      child: Container(
        child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
            double containerWidth = displayWidth(context) / 2.05;
            return Container(
              width: containerWidth,
              child: Column(
                children: [
                  FlipCardWidget(),
                  FlipCardButtonWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
