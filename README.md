# Flutter Bloc Card Flip

Not really any other way to describe this, an exercise in exploring a card flipping action on a board of cards using Flutter BloC state management.

## Web Application

[https://alienspaces.github.io/flutter-bloc-card-flip/](https://alienspaces.github.io/flutter-bloc-card-flip/)

## CI Flow

All merges to the `master` branch run through automated tests followed by an automated web build and push to the `publish` branch which contains the current source for the above mentioned web application!

Push from local with automated production deployment as you would expect!

## TODO

- Implement a card "board" with various functions
  - Shuffle deck (choose deck count)
  - Game type (match cards, labyrinth)
- GitlabCI pipeline (hell, why not..)
