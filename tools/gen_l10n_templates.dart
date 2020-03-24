// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

const String fileTemplate = '''
@(header)
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import
import 'package:intl/intl.dart' as intl;

@(messageClassImports)

// ignore_for_file: unnecessary_brace_in_string_interps

/// Callers can lookup localized strings with an instance of @(class) returned
/// by `@(class).of(context)`.
///
/// Applications need to include `@(class).delegate()` in their app\'s
/// localizationDelegates list, and the locales they support in the app\'s
/// supportedLocales list. For example:
///
/// ```
/// import '@(importFile)';
///
/// return MaterialApp(
///   localizationsDelegates: @(class).localizationsDelegates,
///   supportedLocales: @(class).supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: 0.16.0
///   intl_translation: 0.17.7
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the @(class).supportedLocales
/// property.
abstract class @(class) {
  @(class)(String locale) : assert(locale != null), localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

  static @(class) of(BuildContext context) {
    return Localizations.of<@(class)>(context, @(class));
  }

  static const LocalizationsDelegate<@(class)> delegate = _@(class)Delegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    @(supportedLocales)
  ];

@(methods)}

class _@(class)Delegate extends LocalizationsDelegate<@(class)> {
  const _@(class)Delegate();

  @override
  Future<@(class)> load(Locale locale) {
    return SynchronousFuture<@(class)>(@(lookupName)(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[@(supportedLanguageCodes)].contains(locale.languageCode);

  @override
  bool shouldReload(_@(class)Delegate old) => false;
}

@(class) @(lookupName)(Locale locale) {
  switch(locale.languageCode) {
    @(lookupBody)
  }
  assert(false, '@(class).delegate failed to load unsupported locale "\$locale"');
  return null;
}
''';

const String numberFormatTemplate = '''
    final intl.NumberFormat @(placeholder)NumberFormat = intl.NumberFormat.@(format)(
      locale: localeName,
      @(parameters)
    );
    final String @(placeholder)String = @(placeholder)NumberFormat.format(@(placeholder));
''';

const String dateFormatTemplate = '''
    final intl.DateFormat @(placeholder)DateFormat = intl.DateFormat.@(format)(localeName);
    final String @(placeholder)String = @(placeholder)DateFormat.format(@(placeholder));
''';

const String getterTemplate = '''
  @override
  String get @(name) => @(message);''';

const String methodTemplate = '''
  @override
  String @(name)(@(parameters)) {
    return @(message);
  }''';

const String formatMethodTemplate = '''
  @override
  String @(name)(@(parameters)) {
@(dateFormatting)
@(numberFormatting)
    return @(message);
  }''';

const String pluralMethodTemplate = '''
  @override
  String @(name)(@(parameters)) {
@(dateFormatting)
@(numberFormatting)
    return intl.Intl.pluralLogic(
      @(count),
      locale: localeName,
@(pluralLogicArgs),
    );
  }''';

const String classFileTemplate = '''
@(header)
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import '@(fileName)';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for @(language) (`@(localeName)`).
class @(class) extends @(baseClass) {
  @(class)([String locale = '@(localeName)']) : super(locale);

@(methods)
}
@(subclasses)''';

const String subclassTemplate = '''

/// The translations for @(language) (`@(localeName)`).
class @(class) extends @(baseLanguageClassName) {
  @(class)(): super('@(localeName)');

@(methods)
}
''';

const String baseClassGetterTemplate = '''
  // @(comment)
  String get @(name);
''';

const String baseClassMethodTemplate = '''
  // @(comment)
  String @(name)(@(parameters));
''';

const String switchClauseTemplate = '''case '@(case)': return @(class)();''';

const String countryCodeSwitchTemplate = '''case '@(languageCode)': {
      switch (locale.countryCode) {
        @(switchClauses)
      }
      return @(class)();
    }''';
