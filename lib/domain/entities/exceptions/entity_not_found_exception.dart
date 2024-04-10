class EntityNotFoundException implements Exception {
  EntityNotFoundException({
    required this.id,
  });

  final int id;
}
