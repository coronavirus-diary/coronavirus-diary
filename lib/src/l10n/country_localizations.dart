import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'country_localizations_en.dart';
import 'country_localizations_es.dart';
import 'country_localizations_ko.dart';
import 'country_localizations_vi.dart';
import 'country_localizations_ru.dart';
import 'country_localizations_zh.dart';

abstract class CountryLocalizations {
  const CountryLocalizations();

  static CountryLocalizations of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
        context, CountryLocalizations);
  }

  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  /// Map from country code to localized country name.
  Map<String, String> get countryNames;
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  Future<CountryLocalizations> load(Locale locale) {
    return SynchronousFuture<CountryLocalizations>(
        _lookupCountryLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'ru', 'vi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}

CountryLocalizations _lookupCountryLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'es':
      return const CountryLocalizationsEs();
    case 'ru':
      return const CountryLocalizationsRu();
    case 'vi':
      return const CountryLocalizationsVi();
    case 'ko':
      return const CountryLocalizationsKo();
    case 'zh':
      return const CountryLocalizationsZh();
    default:
      return const CountryLocalizationsEn();
  }
}
