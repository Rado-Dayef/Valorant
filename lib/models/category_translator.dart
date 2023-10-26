class CategoryTranslator {
  static String convert(Object value) {
    if (value is int) {
      return toTypes(
        value.toString(),
      );
    } else {
      return toTypes(
        value as String,
      );
    }
  }

  static String toTypes(String value) {
    return value
        .replaceAll("EEquippableCategory::Heavy", "Heavy")
        .replaceAll("EEquippableCategory::Rifle", "Rifle")
        .replaceAll("EEquippableCategory::Shotgun", "Shotgun")
        .replaceAll("EEquippableCategory::Sidearm", "Sidearm")
        .replaceAll("EEquippableCategory::Sniper", "Sniper")
        .replaceAll("EEquippableCategory::SMG", "SMG")
        .replaceAll("EEquippableCategory::Melee", "Melee");
  }
}

extension CategoriesExtensions on String {
  String get CategoriesTranslator {
    return CategoryTranslator.convert(this);
  }
}
