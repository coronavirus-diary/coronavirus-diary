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

  // The long informed consent question asked of users
  String get consentStepQuestion;

  // Heading for the page show reminds the user that they've said no
  String get deniedConsentHeading;

  // The app's response if the user does not agree to the informed consent question
  String get deniedConsentMessage;

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

  // Error that is displayed if the temperature entered is not in a valid temperature range.
  String get temperatureStepTemperatureOutOfRangeError;

  // Label for entry field
  String get temperatureStepTemperatureLabel;

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

  // Title that appears above the textfield where the user enters their location
  String get locationStepTitle;

  // Error that appears when the user enters their zip code incorrectly.
  String get locationStepInvalidZipCode;

  // Error that appears when the user enters their country incorrectly.
  String get locationStepInvalidCountry;

  // Title that appears within the textfield where the user enters their ZIP code
  String get locationStepZipCode;

  // Helper text describing what to enter in the text field for country.
  String get locationStepCountryHelper;

  // Radio button selection indicating that the user lives in the USA.
  String get locationStepInUSA;

  // Radio button selection indicating that the user lives outside of the USA.
  String get locationStepAnotherCountry;

  // Title that appears within the textfield where the user enters their country
  String get locationStepCountry;

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

  // Question title.
  String get questionShortnessOfBreathTitle;

  // Question subtitle.
  String get questionShortnessOfBreathSubtitle;

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

  // Let the user that they can scroll to see more content
  String get scrollMoreIndicatorMessage;

  // Menu item displayed with no country is yet selected.
  String get locationStepNoCountrySelected;

  // Name of the country 'Andorra'.
  String get countryCodeAD;

  // Name of the country 'United Arab Emirates'.
  String get countryCodeAE;

  // Name of the country 'Afghanistan'.
  String get countryCodeAF;

  // Name of the country 'Antigua and Barbuda'.
  String get countryCodeAG;

  // Name of the country 'Anguilla'.
  String get countryCodeAI;

  // Name of the country 'Albania'.
  String get countryCodeAL;

  // Name of the country 'Armenia'.
  String get countryCodeAM;

  // Name of the country 'Angola'.
  String get countryCodeAO;

  // Name of the country 'Antarctica'.
  String get countryCodeAQ;

  // Name of the country 'Argentina'.
  String get countryCodeAR;

  // Name of the country 'American Samoa'.
  String get countryCodeAS;

  // Name of the country 'Austria'.
  String get countryCodeAT;

  // Name of the country 'Australia'.
  String get countryCodeAU;

  // Name of the country 'Aruba'.
  String get countryCodeAW;

  // Name of the country 'Åland Islands'.
  String get countryCodeAX;

  // Name of the country 'Azerbaijan'.
  String get countryCodeAZ;

  // Name of the country 'Bosnia and Herzegovina'.
  String get countryCodeBA;

  // Name of the country 'Barbados'.
  String get countryCodeBB;

  // Name of the country 'Bangladesh'.
  String get countryCodeBD;

  // Name of the country 'Belgium'.
  String get countryCodeBE;

  // Name of the country 'Burkina Faso'.
  String get countryCodeBF;

  // Name of the country 'Bulgaria'.
  String get countryCodeBG;

  // Name of the country 'Bahrain'.
  String get countryCodeBH;

  // Name of the country 'Burundi'.
  String get countryCodeBI;

  // Name of the country 'Benin'.
  String get countryCodeBJ;

  // Name of the country 'Saint Barthélemy'.
  String get countryCodeBL;

  // Name of the country 'Bermuda'.
  String get countryCodeBM;

  // Name of the country 'Brunei Darussalam'.
  String get countryCodeBN;

  // Name of the country 'Bolivia (Plurinational State of)'.
  String get countryCodeBO;

  // Name of the country 'Bonaire, Sint Eustatius and Saba'.
  String get countryCodeBQ;

  // Name of the country 'Brazil'.
  String get countryCodeBR;

  // Name of the country 'Bahamas'.
  String get countryCodeBS;

  // Name of the country 'Bhutan'.
  String get countryCodeBT;

  // Name of the country 'Bouvet Island'.
  String get countryCodeBV;

  // Name of the country 'Botswana'.
  String get countryCodeBW;

  // Name of the country 'Belarus'.
  String get countryCodeBY;

  // Name of the country 'Belize'.
  String get countryCodeBZ;

  // Name of the country 'Canada'.
  String get countryCodeCA;

  // Name of the country 'Cocos (Keeling) Islands'.
  String get countryCodeCC;

  // Name of the country 'Congo, Democratic Republic of the'.
  String get countryCodeCD;

  // Name of the country 'Central African Republic'.
  String get countryCodeCF;

  // Name of the country 'Congo'.
  String get countryCodeCG;

  // Name of the country 'Switzerland'.
  String get countryCodeCH;

  // Name of the country 'Côte d'Ivoire'.
  String get countryCodeCI;

  // Name of the country 'Cook Islands'.
  String get countryCodeCK;

  // Name of the country 'Chile'.
  String get countryCodeCL;

  // Name of the country 'Cameroon'.
  String get countryCodeCM;

  // Name of the country 'China'.
  String get countryCodeCN;

  // Name of the country 'Colombia'.
  String get countryCodeCO;

  // Name of the country 'Costa Rica'.
  String get countryCodeCR;

  // Name of the country 'Cuba'.
  String get countryCodeCU;

  // Name of the country 'Cabo Verde'.
  String get countryCodeCV;

  // Name of the country 'Curaçao'.
  String get countryCodeCW;

  // Name of the country 'Christmas Island'.
  String get countryCodeCX;

  // Name of the country 'Cyprus'.
  String get countryCodeCY;

  // Name of the country 'Czechia'.
  String get countryCodeCZ;

  // Name of the country 'Germany'.
  String get countryCodeDE;

  // Name of the country 'Djibouti'.
  String get countryCodeDJ;

  // Name of the country 'Denmark'.
  String get countryCodeDK;

  // Name of the country 'Dominica'.
  String get countryCodeDM;

  // Name of the country 'Dominican Republic'.
  String get countryCodeDO;

  // Name of the country 'Algeria'.
  String get countryCodeDZ;

  // Name of the country 'Ecuador'.
  String get countryCodeEC;

  // Name of the country 'Estonia'.
  String get countryCodeEE;

  // Name of the country 'Egypt'.
  String get countryCodeEG;

  // Name of the country 'Western Sahara'.
  String get countryCodeEH;

  // Name of the country 'Eritrea'.
  String get countryCodeER;

  // Name of the country 'Spain'.
  String get countryCodeES;

  // Name of the country 'Ethiopia'.
  String get countryCodeET;

  // Name of the country 'Finland'.
  String get countryCodeFI;

  // Name of the country 'Fiji'.
  String get countryCodeFJ;

  // Name of the country 'Falkland Islands (Malvinas)'.
  String get countryCodeFK;

  // Name of the country 'Micronesia (Federated States of)'.
  String get countryCodeFM;

  // Name of the country 'Faroe Islands'.
  String get countryCodeFO;

  // Name of the country 'France'.
  String get countryCodeFR;

  // Name of the country 'Gabon'.
  String get countryCodeGA;

  // Name of the country 'United Kingdom'.
  String get countryCodeGB;

  // Name of the country 'Grenada'.
  String get countryCodeGD;

  // Name of the country 'Georgia'.
  String get countryCodeGE;

  // Name of the country 'French Guiana'.
  String get countryCodeGF;

  // Name of the country 'Guernsey'.
  String get countryCodeGG;

  // Name of the country 'Ghana'.
  String get countryCodeGH;

  // Name of the country 'Gibraltar'.
  String get countryCodeGI;

  // Name of the country 'Greenland'.
  String get countryCodeGL;

  // Name of the country 'Gambia'.
  String get countryCodeGM;

  // Name of the country 'Guinea'.
  String get countryCodeGN;

  // Name of the country 'Guadeloupe'.
  String get countryCodeGP;

  // Name of the country 'Equatorial Guinea'.
  String get countryCodeGQ;

  // Name of the country 'Greece'.
  String get countryCodeGR;

  // Name of the country 'South Georgia and the South Sandwich Islands'.
  String get countryCodeGS;

  // Name of the country 'Guatemala'.
  String get countryCodeGT;

  // Name of the country 'Guam'.
  String get countryCodeGU;

  // Name of the country 'Guinea-Bissau'.
  String get countryCodeGW;

  // Name of the country 'Guyana'.
  String get countryCodeGY;

  // Name of the country 'Hong Kong'.
  String get countryCodeHK;

  // Name of the country 'Heard Island and McDonald Islands'.
  String get countryCodeHM;

  // Name of the country 'Honduras'.
  String get countryCodeHN;

  // Name of the country 'Croatia'.
  String get countryCodeHR;

  // Name of the country 'Haiti'.
  String get countryCodeHT;

  // Name of the country 'Hungary'.
  String get countryCodeHU;

  // Name of the country 'Indonesia'.
  String get countryCodeID;

  // Name of the country 'Ireland'.
  String get countryCodeIE;

  // Name of the country 'Israel'.
  String get countryCodeIL;

  // Name of the country 'Isle of Man'.
  String get countryCodeIM;

  // Name of the country 'India'.
  String get countryCodeIN;

  // Name of the country 'British Indian Ocean Territory'.
  String get countryCodeIO;

  // Name of the country 'Iraq'.
  String get countryCodeIQ;

  // Name of the country 'Iran (Islamic Republic of)'.
  String get countryCodeIR;

  // Name of the country 'Iceland'.
  String get countryCodeIS;

  // Name of the country 'Italy'.
  String get countryCodeIT;

  // Name of the country 'Jersey'.
  String get countryCodeJE;

  // Name of the country 'Jamaica'.
  String get countryCodeJM;

  // Name of the country 'Jordan'.
  String get countryCodeJO;

  // Name of the country 'Japan'.
  String get countryCodeJP;

  // Name of the country 'Kenya'.
  String get countryCodeKE;

  // Name of the country 'Kyrgyzstan'.
  String get countryCodeKG;

  // Name of the country 'Cambodia'.
  String get countryCodeKH;

  // Name of the country 'Kiribati'.
  String get countryCodeKI;

  // Name of the country 'Comoros'.
  String get countryCodeKM;

  // Name of the country 'Saint Kitts and Nevis'.
  String get countryCodeKN;

  // Name of the country 'Korea (Democratic People's Republic of)'.
  String get countryCodeKP;

  // Name of the country 'Korea, Republic of'.
  String get countryCodeKR;

  // Name of the country 'Kuwait'.
  String get countryCodeKW;

  // Name of the country 'Cayman Islands'.
  String get countryCodeKY;

  // Name of the country 'Kazakhstan'.
  String get countryCodeKZ;

  // Name of the country 'Lao People's Democratic Republic'.
  String get countryCodeLA;

  // Name of the country 'Lebanon'.
  String get countryCodeLB;

  // Name of the country 'Saint Lucia'.
  String get countryCodeLC;

  // Name of the country 'Liechtenstein'.
  String get countryCodeLI;

  // Name of the country 'Sri Lanka'.
  String get countryCodeLK;

  // Name of the country 'Liberia'.
  String get countryCodeLR;

  // Name of the country 'Lesotho'.
  String get countryCodeLS;

  // Name of the country 'Lithuania'.
  String get countryCodeLT;

  // Name of the country 'Luxembourg'.
  String get countryCodeLU;

  // Name of the country 'Latvia'.
  String get countryCodeLV;

  // Name of the country 'Libya'.
  String get countryCodeLY;

  // Name of the country 'Morocco'.
  String get countryCodeMA;

  // Name of the country 'Monaco'.
  String get countryCodeMC;

  // Name of the country 'Moldova, Republic of'.
  String get countryCodeMD;

  // Name of the country 'Montenegro'.
  String get countryCodeME;

  // Name of the country 'Saint Martin (French part)'.
  String get countryCodeMF;

  // Name of the country 'Madagascar'.
  String get countryCodeMG;

  // Name of the country 'Marshall Islands'.
  String get countryCodeMH;

  // Name of the country 'North Macedonia'.
  String get countryCodeMK;

  // Name of the country 'Mali'.
  String get countryCodeML;

  // Name of the country 'Myanmar'.
  String get countryCodeMM;

  // Name of the country 'Mongolia'.
  String get countryCodeMN;

  // Name of the country 'Macao'.
  String get countryCodeMO;

  // Name of the country 'Northern Mariana Islands'.
  String get countryCodeMP;

  // Name of the country 'Martinique'.
  String get countryCodeMQ;

  // Name of the country 'Mauritania'.
  String get countryCodeMR;

  // Name of the country 'Montserrat'.
  String get countryCodeMS;

  // Name of the country 'Malta'.
  String get countryCodeMT;

  // Name of the country 'Mauritius'.
  String get countryCodeMU;

  // Name of the country 'Maldives'.
  String get countryCodeMV;

  // Name of the country 'Malawi'.
  String get countryCodeMW;

  // Name of the country 'Mexico'.
  String get countryCodeMX;

  // Name of the country 'Malaysia'.
  String get countryCodeMY;

  // Name of the country 'Mozambique'.
  String get countryCodeMZ;

  // Name of the country 'Namibia'.
  String get countryCodeNA;

  // Name of the country 'New Caledonia'.
  String get countryCodeNC;

  // Name of the country 'Niger'.
  String get countryCodeNE;

  // Name of the country 'Norfolk Island'.
  String get countryCodeNF;

  // Name of the country 'Nigeria'.
  String get countryCodeNG;

  // Name of the country 'Nicaragua'.
  String get countryCodeNI;

  // Name of the country 'Netherlands'.
  String get countryCodeNL;

  // Name of the country 'Norway'.
  String get countryCodeNO;

  // Name of the country 'Nepal'.
  String get countryCodeNP;

  // Name of the country 'Nauru'.
  String get countryCodeNR;

  // Name of the country 'Niue'.
  String get countryCodeNU;

  // Name of the country 'New Zealand'.
  String get countryCodeNZ;

  // Name of the country 'Oman'.
  String get countryCodeOM;

  // Name of the country 'Panama'.
  String get countryCodePA;

  // Name of the country 'Peru'.
  String get countryCodePE;

  // Name of the country 'French Polynesia'.
  String get countryCodePF;

  // Name of the country 'Papua New Guinea'.
  String get countryCodePG;

  // Name of the country 'Philippines'.
  String get countryCodePH;

  // Name of the country 'Pakistan'.
  String get countryCodePK;

  // Name of the country 'Poland'.
  String get countryCodePL;

  // Name of the country 'Saint Pierre and Miquelon'.
  String get countryCodePM;

  // Name of the country 'Pitcairn'.
  String get countryCodePN;

  // Name of the country 'Puerto Rico'.
  String get countryCodePR;

  // Name of the country 'Palestine, State of'.
  String get countryCodePS;

  // Name of the country 'Portugal'.
  String get countryCodePT;

  // Name of the country 'Palau'.
  String get countryCodePW;

  // Name of the country 'Paraguay'.
  String get countryCodePY;

  // Name of the country 'Qatar'.
  String get countryCodeQA;

  // Name of the country 'Réunion'.
  String get countryCodeRE;

  // Name of the country 'Romania'.
  String get countryCodeRO;

  // Name of the country 'Serbia'.
  String get countryCodeRS;

  // Name of the country 'Russian Federation'.
  String get countryCodeRU;

  // Name of the country 'Rwanda'.
  String get countryCodeRW;

  // Name of the country 'Saudi Arabia'.
  String get countryCodeSA;

  // Name of the country 'Solomon Islands'.
  String get countryCodeSB;

  // Name of the country 'Seychelles'.
  String get countryCodeSC;

  // Name of the country 'Sudan'.
  String get countryCodeSD;

  // Name of the country 'Sweden'.
  String get countryCodeSE;

  // Name of the country 'Singapore'.
  String get countryCodeSG;

  // Name of the country 'Saint Helena, Ascension and Tristan da Cunha'.
  String get countryCodeSH;

  // Name of the country 'Slovenia'.
  String get countryCodeSI;

  // Name of the country 'Svalbard and Jan Mayen'.
  String get countryCodeSJ;

  // Name of the country 'Slovakia'.
  String get countryCodeSK;

  // Name of the country 'Sierra Leone'.
  String get countryCodeSL;

  // Name of the country 'San Marino'.
  String get countryCodeSM;

  // Name of the country 'Senegal'.
  String get countryCodeSN;

  // Name of the country 'Somalia'.
  String get countryCodeSO;

  // Name of the country 'Suriname'.
  String get countryCodeSR;

  // Name of the country 'South Sudan'.
  String get countryCodeSS;

  // Name of the country 'Sao Tome and Principe'.
  String get countryCodeST;

  // Name of the country 'El Salvador'.
  String get countryCodeSV;

  // Name of the country 'Sint Maarten (Dutch part)'.
  String get countryCodeSX;

  // Name of the country 'Syrian Arab Republic'.
  String get countryCodeSY;

  // Name of the country 'Eswatini'.
  String get countryCodeSZ;

  // Name of the country 'Turks and Caicos Islands'.
  String get countryCodeTC;

  // Name of the country 'Chad'.
  String get countryCodeTD;

  // Name of the country 'French Southern Territories'.
  String get countryCodeTF;

  // Name of the country 'Togo'.
  String get countryCodeTG;

  // Name of the country 'Thailand'.
  String get countryCodeTH;

  // Name of the country 'Tajikistan'.
  String get countryCodeTJ;

  // Name of the country 'Tokelau'.
  String get countryCodeTK;

  // Name of the country 'Timor-Leste'.
  String get countryCodeTL;

  // Name of the country 'Turkmenistan'.
  String get countryCodeTM;

  // Name of the country 'Tunisia'.
  String get countryCodeTN;

  // Name of the country 'Tonga'.
  String get countryCodeTO;

  // Name of the country 'Turkey'.
  String get countryCodeTR;

  // Name of the country 'Trinidad and Tobago'.
  String get countryCodeTT;

  // Name of the country 'Tuvalu'.
  String get countryCodeTV;

  // Name of the country 'Taiwan, Province of China'.
  String get countryCodeTW;

  // Name of the country 'Tanzania, United Republic of'.
  String get countryCodeTZ;

  // Name of the country 'Ukraine'.
  String get countryCodeUA;

  // Name of the country 'Uganda'.
  String get countryCodeUG;

  // Name of the country 'United States Minor Outlying Islands'.
  String get countryCodeUM;

  // Name of the country 'United States of America'.
  String get countryCodeUS;

  // Name of the country 'Uruguay'.
  String get countryCodeUY;

  // Name of the country 'Uzbekistan'.
  String get countryCodeUZ;

  // Name of the country 'Holy See'.
  String get countryCodeVA;

  // Name of the country 'Saint Vincent and the Grenadines'.
  String get countryCodeVC;

  // Name of the country 'Venezuela (Bolivarian Republic of)'.
  String get countryCodeVE;

  // Name of the country 'Virgin Islands (British)'.
  String get countryCodeVG;

  // Name of the country 'Virgin Islands (U.S.)'.
  String get countryCodeVI;

  // Name of the country 'Viet Nam'.
  String get countryCodeVN;

  // Name of the country 'Vanuatu'.
  String get countryCodeVU;

  // Name of the country 'Wallis and Futuna'.
  String get countryCodeWF;

  // Name of the country 'Samoa'.
  String get countryCodeWS;

  // Name of the country 'Yemen'.
  String get countryCodeYE;

  // Name of the country 'Mayotte'.
  String get countryCodeYT;

  // Name of the country 'South Africa'.
  String get countryCodeZA;

  // Name of the country 'Zambia'.
  String get countryCodeZM;

  // Name of the country 'Zimbabwe'.
  String get countryCodeZW;
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
