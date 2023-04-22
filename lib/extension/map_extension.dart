import 'dart:convert';

extension MapStringExtension on Map<String, dynamic> {
  String get prettyJSONString {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }
}

extension MapStringListExtension on List<Map<String, dynamic>> {
  String get prettyJSONString {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }
}
