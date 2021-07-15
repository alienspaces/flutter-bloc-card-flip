# Flutter Bloc Card Flip

Not really any other way to describe this, an exercise in exploring a card flipping action on a board of cards using Flutter BloC state management.

## Web Application

[https://alienspaces.github.io/flutter-bloc-card-flip/](https://alienspaces.github.io/flutter-bloc-card-flip/)

## CI Flow

All merges to the `master` branch run through automated tests and then an automated web build and push to the `publish` branch, where the above mentioned web application is directly sourced! Push from local with automated production deployment as you would expect!

## TODO

- Implement a card "board" with various functions
  - Shuffle deck (choose deck count)
  - Game type (match cards, labyrinth)
- GitlabCI pipeline (hell, why not..)
