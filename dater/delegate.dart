import 'package:flutter/material.dart';

class CancelButtonLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const CancelButtonLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<MaterialLocalizations> load(Locale locale) =>
      Future.value(const CancelButtonLocalization());

  @override
  bool shouldReload(CancelButtonLocalizationDelegate old) => false;
}

class CancelButtonLocalization extends DefaultMaterialLocalizations {
  const CancelButtonLocalization();

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get okButtonLabel => 'Select';

  @override
  String formatMonthYear(DateTime date) {
    // final String year = formatYear(date);
    final String month = _months[date.month - DateTime.january];
    return month;
  }

  @override
  String formatYear(DateTime date) => date.year.toString();

  static const List<String> _months = <String>[
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
}
