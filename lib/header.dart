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
      ElevatedButton(
        onPressed: callbacks.openBoardPage,
        child: Text(
          'Open Board',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      ElevatedButton(
        onPressed: callbacks.openDealPage,
        child: Text(
          'Open Deal',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
    ],
  );
}
