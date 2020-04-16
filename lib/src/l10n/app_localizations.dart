import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
///   intl: 0.16.1
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : assert(locale != null),
        localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('es', '419'),
    Locale('ko'),
    Locale('ru'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  // Heading on the initial screen. The name of the app, CovidNearMe, should not be translated
  String get tutorialIntroStepWelcome;

  // Brief description below the name of the app.
  String get tutorialIntroStepDescription;

  // Semantics label for tutorialIntroStepWelcome which makes CovidNearMe legible for screen readers
  String get tutorialIntroStepWelcomeSemanticsLabel;

  // Describes an action you can take using the app
  String get tutorialIntroStepLocalStatistics;

  // Describes an action you can take using the app
  String get tutorialIntroStepSubmitSymptoms;

  // Describes the benefit of the app to the community.
  String get tutorialIntroStepAidEffort;

  // Label for the button that shows the next app screen
  String get tutorialIntroStepGetStarted;

  // Title that appears above the text field where the user enters their location during the tutorial
  String get tutorialLocationStepTitle;

  // Callout used above partner logos.
  String get brandingCallout;

  // Tooltip for the 'three dots' main menu on the home page.
  String get homeMenuTooltip;

  // Label for the about button in the home page menu.
  String get homeMenuAbout;

  // Semantic Label for the about button in the home page menu.
  String get homeMenuAboutSemantics;

  // Description in the 'About' box, above a hyperlink to the source website.
  String get aboutBoxDescription;

  // Text label on a hyperlink to the source code for the app.
  String get aboutBoxLinkText;

  // Heading text for the local statistics card on the home screen
  String get homeScreenLocalStatisticsTitle;

  // Subheading text for the local statistics card on the home screen
  String get homeScreenLocalStatisticsSubtitle;

  // Button text for the local statistics card on the home screen
  String get homeScreenLocalStatisticsButton;

  // Heading text for the report symptoms card on the home screen
  String get homeScreenReportSymptomsTitle;

  // Subheading text for the report symptoms card on the home screen
  String get homeScreenReportSymptomsSubtitle;

  // Button text for the report symptoms card on the home screen
  String get homeScreenReportSymptomsButton;

  // Heading text for the share app card on the home screen
  String get homeScreenShareAppTitle;

  // Subheading text for the share app card on the home screen
  String get homeScreenShareAppSubtitle;

  // Button text for the share app card on the home screen
  String get homeScreenShareAppButton;

  // Tell the user that the symptom report is loading
  String get symptomReportLoading;

  // An error occurred while trying to fetch data
  String get symptomReportErrorRetrievingExperience;

  // Title for the symptom report screen
  String get symptomReportTitle;

  // Which step in the overall process is the patient currently working on
  String symptomReportProgressBarPercentCompleteText(
      int stepIndex, int stepCount);

  // Submit the symptom report
  String get symptomReportSubmitButton;

  // Continue to the next symptom report step
  String get symptomReportNextButton;

  // Prompt when all the questions haven't been answered yet.
  String get symptomReportAnswerAllQuestions;

  // Title for the symptom report intro step
  String get symptomReportIntroStepTitle;

  // Tell the user that they will be asked questions
  String get symptomReportIntroStepHealthQuestions;

  // Explain that the data will be submitted anonymously and used for COVID-19 response efforts
  String get symptomReportIntroStepDataContribution;

  // Starts the symptom report by showing the first step
  String get symptomReportIntroStepStartButton;

  // The long informed consent question asked of users
  String get consentStepQuestion;

  // Label for the button that indicates that the user will not accept the app license
  String get consentStepDecline;

  // Label for the button that indicates that the user did not accept the app license
  String get consentStepDeclineActive;

  // Label for the button that indicates that the user will accept the app license
  String get consentStepAgree;

  // Label for the button that indicates that the user did accept the app license
  String get consentStepAgreeActive;

  // Heading for the page show reminds the user that they've said no
  String get deniedConsentHeading;

  // The app's response if the user does not agree to the informed consent question
  String get deniedConsentMessage;

  // Text for the safety tips button on the denied consent screen
  String get deniedConsentSafetyTipsButton;

  // Title for the symptom report location step
  String get symptomReportLocationStepTitle;

  // An internal error occurred, the symptom report questions failed to load
  String get questionsStepQuestionsLoadedError;

  // Label next to loading indicator
  String get systemReportSubmitting;

  // Tooltip for the back button
  String get systemReportBackToHomePage;

  // The title of the ThankYou screen
  String get thankYouScreenTitle;

  // Return to the home screen
  String get thankYouScreenFinishButton;

  // Ask the user to report their symptoms again tomorrow
  String get thankYouScreenCallToAction;

  // Ask the user to contact a physician if their symptoms become serious
  String get thankYouScreenSeriousSymptoms;

  // Button for safety tips
  String get thankYouScreenSafetyTipsButton;

  // Button for sharing the app
  String get thankYouScreenShareAppButton;

  // Question title.
  String get questionShortnessOfBreathTitle;

  // Question answer.
  String get questionShortnessOfBreathAnswer0;

  // Question answer.
  String get questionShortnessOfBreathAnswer1;

  // Question answer.
  String get questionShortnessOfBreathAnswer2;

  // Question answer.
  String get questionShortnessOfBreathAnswer3;

  // Question accessibility semantics description.
  String get questionShortnessOfBreathSemantics0;

  // Question accessibility semantics description.
  String get questionShortnessOfBreathSemantics1;

  // Question accessibility semantics description.
  String get questionShortnessOfBreathSemantics2;

  // Question accessibility semantics description.
  String get questionShortnessOfBreathSemantics3;

  // Question title.
  String get questionHaveACoughTitle;

  // Question answer.
  String get questionHaveACoughAnswer0;

  // Question answer.
  String get questionHaveACoughAnswer1;

  // Question answer.
  String get questionHaveACoughAnswer2;

  // Question answer.
  String get questionHaveACoughAnswer3;

  // Question accessibility semantics description.
  String get questionHaveACoughSemantics0;

  // Question accessibility semantics description.
  String get questionHaveACoughSemantics1;

  // Question accessibility semantics description.
  String get questionHaveACoughSemantics2;

  // Question accessibility semantics description.
  String get questionHaveACoughSemantics3;

  // Question title.
  String get questionHaveNauseaTitle;

  // Question answer.
  String get questionHaveNauseaAnswer0;

  // Question answer.
  String get questionHaveNauseaAnswer1;

  // Question answer.
  String get questionHaveNauseaAnswer2;

  // Question answer.
  String get questionHaveNauseaAnswer3;

  // Question accessibility semantics description.
  String get questionHaveNauseaSemantics0;

  // Question accessibility semantics description.
  String get questionHaveNauseaSemantics1;

  // Question accessibility semantics description.
  String get questionHaveNauseaSemantics2;

  // Question accessibility semantics description.
  String get questionHaveNauseaSemantics3;

  // Question title.
  String get questionHaveAFeverTitle;

  // Question answer.
  String get questionHaveAFeverAnswer0;

  // Question answer.
  String get questionHaveAFeverAnswer1;

  // Question answer.
  String get questionHaveAFeverAnswer2;

  // Question accessibility semantics description.
  String get questionHaveAFeverSemantics0;

  // Question accessibility semantics description.
  String get questionHaveAFeverSemantics1;

  // Question accessibility semantics description.
  String get questionHaveAFeverSemantics2;

  // Question title.
  String get questionHowHighWasYourFever;

  // Question title.
  String get questionHaveYouBeenFluTestedTitle;

  // Question answer.
  String get questionYes;

  // Question answer.
  String get questionNo;

  // Question title.
  String get questionFluTestPositiveTitle;

  // Question accessibility semantics description.
  String get questionFluTestPositiveSemantics0;

  // Question accessibility semantics description.
  String get questionFluTestPositiveSemantics1;

  // Question title.
  String get questionWhatWasPositiveTitle;

  // Question title.
  String get questionTryForTestingTitle;

  // Question accessibility semantics description.
  String get questionTryForTestingSemantics0;

  // Question accessibility semantics description.
  String get questionTryForTestingSemantics1;

  // Question title.
  String get questionCovid19TestResultTitle;

  // Question answer.
  String get questionCovid19TestResultAnswer0;

  // Question answer.
  String get questionCovid19TestResultAnswer1;

  // Question answer.
  String get questionCovid19TestResultAnswer2;

  // Question answer.
  String get questionCovid19TestResultAnswer3;

  // Question answer.
  String get questionCovid19TestResultAnswer4;

  // Label for a button that brings up a help screen
  String get temperatureFieldHelpButton;

  // Error that is displayed if the temperature entered is not in a valid temperature range.
  String get temperatureFieldOutOfRangeError;

  // Title for a dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogTitle;

  // Subsection heading for recommendations about when to measure the user's temperature
  String get temperatureDialogWhenHeading;

  // User advice
  String get temperatureDialogWait30Minutes;

  // User advice
  String get temperatureDialogWait6Hours;

  // Subsection heading for recommendations about how to measure the user's temperature
  String get temperatureDialogHowHeading;

  // Step 1 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogStep1;

  // Step 2 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogStep2;

  // Step 3 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogStep3;

  // Step 4 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogStep4;

  // Step 5 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogStep5;

  // Return to the symptom report screen from the dialog that explains how to take your temperature in 5 steps
  String get temperatureDialogCloseButton;

  // Prompt for the app sharing sheet, see https://pub.dev/packages/share. The {{ APP_LINK }} word should not be translated, it will be replaced by a link the app at runtime
  String get shareAppDownloadPrompt;

  // Title for the safety tips screen
  String get safetyTipsTitle;

  // Subtitle for the safety tips screen
  String get safetyTipsSubtitle;

  // Safety tips screen: handwashing tip
  String get safetyTipsWashYourHands;

  // Safety tips screen: social distancing tip
  String get safetyTipsSocialDistancing;

  // Safety tips screen: contact physician tip
  String get safetyTipsContactPhysician;

  // Title that appears above the text field where the user enters their location
  String get locationStepTitle;

  // Error that appears when the user enters their zip code incorrectly.
  String get locationStepInvalidZipCode;

  // Title that appears within the text field where the user enters their ZIP code
  String get locationStepZipCode;

  // Menu item displayed with no country is yet selected.
  String get locationStepNoCountrySelected;

  // Menu item displayed with no country is yet selected.
  String get locationStepCountrySearchPrompt;

  // Label for the dropdown button that selects a country.
  String get locationStepCountryButtonLabel;

  // Label for button that indicates that the user will continue using the app offline
  String get networkUnavailableBannerContinueOffline;

  // Label for button that opens the system network settings
  String get networkUnavailableBannerConnectToWiFi;

  // Generic message shown when a request to the server fails.
  String get networkRequestError;

  // Message shown on the banner displayed when no network connection is detected
  String get networkUnavailableBannerMessage;

  // Let the user that they can scroll to see more content
  String get scrollMoreIndicatorMessage;

  // Title for the local statistics screen.
  String get localStatisticsTitle;

  // Text shown when the user has not selected a location.
  String get localStatisticsNoLocationSelected;

  // Text shown when there is no data available for a location.
  String get localStatisticsNoDataAvailable;

  // Text for the local statistics location picker.
  String get localStatisticsLocationInput;

  // Title of the local statistics recent locations menu.
  String get localStatisticsRecentLocationsMenuTitle;

  // Label for Cases statistics on the statistics screen.
  String get statisticsLabelCases;

  // Label for Deaths statistics on the statistics screen.
  String get statisticsLabelDeaths;

  // Label for Recoveries statistics on the statistics screen.
  String get statisticsLabelRecoveries;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'en',
        'es',
        'ko',
        'ru',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ko':
      return AppLocalizationsKo();
    case 'ru':
      return AppLocalizationsRu();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  assert(false,
      'AppLocalizations.delegate failed to load unsupported locale "$locale"');
  return null;
}
