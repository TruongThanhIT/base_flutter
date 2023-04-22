import 'package:flutter/material.dart';

/// If need to write more validator using extension on FormBuilderValidators
/// Usage example :
//      TextFormField(
//        decoration: InputDecoration(labelText: 'Full Name'),
//        validator: compose([
//          fieldRequired(context, errorText: 'Required'),
//          fieldMinLength(context, 4, errorText: 'Min length is 4 character'),
//        ]),
//      );
mixin FormBuilderValidators {
  FormFieldValidator<String> compose(List<FormFieldValidator<String>> validators) {
    return (valueCandidate) {
      for (final validator in validators) {
        final validatorResult = validator.call(valueCandidate);
        if (validatorResult != null) {
          return validatorResult;
        }
      }
      return null;
    };
  }

  FormFieldValidator<String> fieldRequired(BuildContext context, {String? errorText}) {
    return (String? valueCandidate) {
      return (valueCandidate == null || valueCandidate.isEmpty) ? errorText : null;
    };
  }

  FormFieldValidator<String> fieldAmount(BuildContext context, {String? errorText}) {
    return (String? valueCandidate) {
      String amountStr = valueCandidate.toString().split('.').join('');
      final int amount = int.tryParse(amountStr) ?? -1;
      return amount <= 0 ? errorText : null;
    };
  }

  FormFieldValidator<String> fieldMinLength(
    BuildContext context,
    int minLength, {
    bool isAllowEmpty = false,
    String? errorText,
  }) {
    return (String? valueCandidate) {
      final valueLength = valueCandidate?.length ?? 0;
      return valueLength < minLength && (!isAllowEmpty || valueLength > 0) ? errorText : null;
    };
  }
}
