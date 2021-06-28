import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Application packages
import 'package:flutter_bloc_exploration/widgets/flip_card.dart';
import 'package:flutter_bloc_exploration/cubit/card_cubit.dart';

// Card search page is child of provider
class CardSearchPage extends StatefulWidget {
  @override
  _CardSearchPageState createState() => _CardSearchPageState();
}

class _CardSearchPageState extends State<CardSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Flipper"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        // Bloc consumer
        child: BlocConsumer<CardCubit, CardState>(
          listener: (context, state) {
            if (state is CardError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is CardInitial) {
              return buildInitial();
            } else if (state is CardFlipping) {
              return buildFlipping();
            } else if (state is CardFlipped) {
              return buildFlipped();
            } else {
              return buildInitial();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlipCardWidget(),
        FlipCardButtonWidget(),
      ],
    );
  }

  Widget buildFlipping() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlipCardWidget(),
        FlipCardButtonWidget(),
      ],
    );
  }

  Column buildFlipped() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlipCardWidget(),
        FlipCardButtonWidget(),
      ],
    );
  }
}

class FlipCardButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        onPressed: () => flipCard(context),
        child: Text('Flip It!'),
      ),
    );
  }

  void flipCard(BuildContext context) {
    final cardCubit = BlocProvider.of<CardCubit>(context);
    cardCubit.getCard();
  }
}
