import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  // The title of the AssessmentScreen
  String get assessmentScreenTitle;

  // The patient does not require further testing
  String get negativeAssessmentTestingCriteria;

  // The patient should check in again tomorrow
  String get negativeAssessmentCheckInTomorrow;

  // Advise the patient to consult a doctor if their symptoms worsen
  String get negativeAssessmentConsultPhysician;

  // Advise the patient to consult a doctor
  String get positiveAssessmentConsultPhysician;

  // Advise the patient to avoid contact with others until they've seen a doctor
  String get positiveAssessmentShowingSymptoms;

  // Advise the patient to remain calm
  String get positiveAssessmentDoNotPanic;

  // An error occurred while trying to fetch data
  String get checkupScreenErrorRetrievingExperience;

  // A label that indicates that the app is busy loading the patient's assessment
  String get checkupScreenHUDLabel;

  // Title for the checkup screen
  String get checkupScreenTitle;

  // Which step in the overall process is the patient currently working on
  String checkupProgressBarPercentCompleteText(int stepIndex, int stepCount);

  // Submit the data for the checkup
  String get checkupStepFinishedSubmit;

  // Continue to the next checkup screen
  String get checkupStepFinishedNext;

  // Prompt when all the questions haven't been answered yet.
  String get checkupStepFinishedAnswerAllQuestions;

  // Heading at the top of the Your Health Checkup screen
  String get introStepTimeForYourCheckup;

  // Tell the patient what they will be doing with the app
  String get introStepWeWillAskQuestions;

  // Explain what the app will tell the patient once they have answered the questions
  String get introStepAtTheEnd;

  // Explain that turning the switch on means that the patient data will be shared with the COVID-19 response effort
  String get introStepSwitchLabelContributeData;

  // Explain that turning the switch on also means that the COVID-19 response effort will ask for the patient's zip code
  String get introStepSwitchLabelCollectPostalCode;

  // Starts the checkup by showing the first checkup screen
  String get introStepButtonStartLabel;

  // An internal error occurred, the checkup questions failed to load
  String get subjectiveStepQuestionsLoadedError;

  // Subsection heading for recommendations about when to measure the user's temperature
  String get temperatureStepWhenHeading;

  // User advice
  String get temperatureStepWait30Minutes;

  // User advice
  String get temperatureStepWait6Hours;

  // Subsection heading for recommendations about how to measure the user's temperature
  String get temperatureStepHowHeading;

  // Ask the user to correct their temperature reading
  String get temperatureStepPleaseEnterValueBelow;

  // Ask the user to correct their temperature reading
  String get temperatureStepPleaseEnterValueAbove;

  // Title for a dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogTitle;

  // Step 1 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogStep1;

  // Step 2 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogStep2;

  // Step 3 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogStep3;

  // Step 4 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogStep4;

  // Step 5 in the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogStep5;

  // Return to the checkup screen from the dialog that explains how to take your temperature in 5 steps
  String get temperatureStepHowToDialogReturn;

  // Title that appears above the textfield where the user enters their temperature
  String get temperatureStepTitle;

  // Title that appears within the textfield where the user enters their temperature
  String get temperatureStepInputLabel;

  // Label for a button that brings up a help screen
  String get temperatureStepHelp;

  // Heading text for the home screen
  String get homeScreenHeading;

  // Subheading text for the home screen
  String get homeScreenDoYouHaveSymptoms;

  // Label for a button that shows the checkup screen
  String get homeScreenCheckupButtonLabel;

  // Tell the user that they've already completed a checkup today
  String get homeScreenYouHaveCompletedCheckup;

  // Tell a user that has already completed their checkup that they can check again tomorrow
  String get homeScreenCheckBackTomorrow;

  // View the assessment of the checkup data
  String get homeScreenViewMyAssessment;

  // Prompt for the app sharing sheet, see https://pub.dev/packages/share. The APP_LINK word should not be translated, it will be replaced by a link the app at runtime
  String get shareAppDownloadPrompt;

  // Title for the app sharing sheet, see https://pub.dev/packages/share
  String get shareAppProtectYourCommunity;

  // Subheading for the app sharing sheet, see https://pub.dev/packages/share
  String get shareAppWithFriendsEtc;

  // Final prompt to share the app for the app sharing sheeting, see https://pub.dev/packages/share
  String get shareAppNow;

  // Title for the screen that lists 3 steps for staying safe
  String get staySafeTitle;

  // Step 1 for the screen that lists 3 steps for staying safe
  String get staySafeWashYourHands;

  // Step 2 for the screen that lists 3 steps for staying safe
  String get staySafeLimitContact;

  // Step 3 for the screen that lists 3 steps for staying safe
  String get staySafeCheckBackIf;

  // Heading on the initial screen. The name of the app, CovidNearMe, should not be translated
  String get tutorialIntroStepWelcome;

  // Describes the outcome of running the app
  String get tutorialIntroStepCompleteACheckup;

  // Describes the benefit of the app
  String get tutorialIntroStepReceiveAssessment;

  // Describes the benefit of the app to the community.
  String get tutorialIntroStepAidEffort;

  // Label for the button that shows the next app screen
  String get tutorialIntroStepLearnMore;

  // Heading that's shown after the user has agreed to the app license. The name of the app, CovidNearMe, should not be translated
  String get getStartedStepJoined;

  // Label for the button that indicates that the user did not accept the app license
  String get consentStepDidNotAgree;

  // Label for the button that indicates that the user will not accept the app license
  String get consentStepNo;

  // Label for the button that indicates that the user did accept the app license
  String get consentStepAgreed;

  // Label for the button that indicates that the user will accept the app license
  String get consentStepIAgree;

  // Displayed while the app is loading the next screen
  String get consentStepLoading;

  // Label for button that indicates that the user will continue using the app offline
  String get networkUnavailableBannerContinueOffline;

  // Label for button that opens the system network settings
  String get networkUnavailableBannerConnectToWiFi;

  // Message shown on the banner displayed when no network connection is detected
  String get networkUnavailableBannerMessage;

  // Label for the back button on the denied consent screen
  String get deniedConsentBackButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations _lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }
  assert(false,
      'AppLocalizations.delegate failed to load unsupported locale "$locale"');
  return null;
}
