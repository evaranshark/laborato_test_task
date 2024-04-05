class ExerciseDuration {
  ExerciseDuration({
    required this.value,
    required this.units,
  });

  final int value;
  final DurationUnit units;
}

enum DurationUnit { sec, min }
