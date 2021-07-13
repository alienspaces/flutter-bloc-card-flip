import 'package:flutter/material.dart';

// Application
import 'package:flutter_bloc_exploration/navigation.dart';

AppBar header(BuildContext context, NavigationCallbacks callbacks) {
  return AppBar(
    title: Text(
      "Card Flip App",
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    ),
    actions: [
      Container(
        padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
        child: ElevatedButton(
          onPressed: callbacks.openDealPage,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondaryVariant,
            onPrimary: Theme.of(context).colorScheme.onSecondary,
            onSurface: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Text(
            'Deal Cards',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
        child: ElevatedButton(
          onPressed: callbacks.openBoardPage,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondaryVariant,
            onPrimary: Theme.of(context).colorScheme.onSecondary,
            onSurface: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Text(
            'Flip Cards',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    ],
  );
}
