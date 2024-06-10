extension BoolExtension on bool? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;

  bool get isFalse => this == false;

  bool get orFalse => this ?? false;
}