import 'package:validators/validators.dart' as validate;

class ValidatorUtil {
  static bool isEmail(String? value) => validate.isEmail(value ?? '');

  static bool isUrl(String? value) => validate.isURL(value ?? '');

  static bool isDate(String? value) => validate.isDate(value ?? '');

  static bool isNumeric(String? value) => validate.isNumeric(value ?? '');

  static bool isCreditCard(String? value) => validate.isCreditCard(value ?? '');

  static bool isUUID(String? value) => validate.isUUID(value);

  static bool isContains(String? value, dynamic seed) =>
      validate.contains(value ?? '', seed);

  static bool isMatches(String? value, String pattern) =>
      validate.matches(value ?? '', pattern);

  static bool isNotNull(String? value) => value != null;

  static bool isNotEmpty(String? value) => value?.trim().isNotEmpty == true;

  static bool isNullOrEmpty(String? value) =>
      value != null || value?.trim().isEmpty == true;

  static bool isValidPhone(String phone) {
    return phone.length >= 10 && phone.length <= 15;
  }
}
