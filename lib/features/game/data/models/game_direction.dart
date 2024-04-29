enum GameDirection {
  forward,
  backward;

  int get value => this == GameDirection.forward ? 1 : -1;

  /// Toggle the direction and return the new direction
  GameDirection toggle() {
    return this == GameDirection.forward
        ? GameDirection.backward
        : GameDirection.forward;
  }

  static GameDirection get initial => GameDirection.forward;
}
