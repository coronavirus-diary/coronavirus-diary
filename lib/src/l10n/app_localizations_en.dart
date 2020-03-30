// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get consentStepQuestion => '''# Informed Consent

Since the US has been short on test kits, we are trying to figure out how many people have symptoms that could be due to COVID-19. The information gathered from this app will help predict where hospitals will be under the most strain. Hopefully, doctors and supplies can then be sent to the right places.

You are anonymous. We don’t want to know who you are! We will ask for your zip code to count cases around specific hospitals. Your symptom severity will be used to guess how likely it is that you have COVID-19, and to see how many people in your region are becoming severely sick.

Total daily cases for zip codes will be provided to state and local health authorities, the CDC, and the US Government to help predict which communities need the most support. We will also make a map here on this app. Data will also be analyzed for geographic trends. For example, we might see fewer cases in areas that closed schools for a long time, or perhaps we will see that the epidemic slows down in hot weather.

You can come back later and enter new information on a different day. We will know it’s you and won’t count you twice. Maybe you feel a lot worse, or you got a COVID-19 test result and would like to let us know.

We will not sell this data. It will only be used for public health and research and deleted after the epidemic has run its course.

If this is all OK and you are 18 years old or older, please click \"I agree\". Otherwise, click \"No\".''';

  @override
  String get deniedConsentHeading => 'Consent denied';

  @override
  String get deniedConsentMessage =>
      'We need you to grant the App consent to perform the required action.';

  @override
  String get assessmentScreenTitle => 'Your Personalized Assessment';

  @override
  String get negativeAssessmentTestingCriteria =>
      'You don\'t meet testing criteria';

  @override
  String get negativeAssessmentCheckInTomorrow =>
      'If you continue to experience symptoms, please check in tomorrow.';

  @override
  String get negativeAssessmentConsultPhysician =>
      'If they become serious, please consult a physician.';

  @override
  String get positiveAssessmentConsultPhysician =>
      'Please contact your physician';

  @override
  String get positiveAssessmentShowingSymptoms =>
      'You are showing symptoms that may be of concern. Please limit your contact with other people until you have a chance to follow up with a physician.';

  @override
  String get positiveAssessmentDoNotPanic =>
      'Do not panic. This is only a preliminary assessment and not a formal medical diagnosis.';

  @override
  String get checkupScreenErrorRetrievingExperience =>
      'There was an error retrieving the checkup experience. Please try again later.';

  @override
  String get checkupScreenHUDLabel => 'Loading your assessment';

  @override
  String get checkupScreenTitle => 'Your Health Checkup';

  @override
  String checkupProgressBarPercentCompleteText(int stepIndex, int stepCount) {
    final intl.NumberFormat stepIndexNumberFormat =
        intl.NumberFormat.compactLong(
      locale: localeName,
    );
    final String stepIndexString = stepIndexNumberFormat.format(stepIndex);
    final intl.NumberFormat stepCountNumberFormat =
        intl.NumberFormat.compactLong(
      locale: localeName,
    );
    final String stepCountString = stepCountNumberFormat.format(stepCount);

    return 'Step ${stepIndexString} of ${stepCountString}';
  }

  @override
  String get checkupStepFinishedSubmit => 'SUBMIT';

  @override
  String get checkupStepFinishedNext => 'NEXT';

  @override
  String get checkupStepFinishedAnswerAllQuestions =>
      'Please answer all the questions to continue';

  @override
  String get introStepTimeForYourCheckup => 'It\'s time for your checkup.';

  @override
  String get introStepWeWillAskQuestions =>
      'We will ask you a few questions and have you take your temperature.';

  @override
  String get introStepAtTheEnd =>
      'At the end, you will receive a personalized COVID-19 risk assessment and recommendations for staying healthy.';

  @override
  String get introStepSwitchLabelContributeData =>
      'Contribute my data to the COVID-19 response effort.';

  @override
  String get introStepSwitchLabelCollectPostalCode =>
      'We will collect your zip code.';

  @override
  String get introStepButtonStartLabel => 'START CHECKUP';

  @override
  String get subjectiveStepQuestionsLoadedError =>
      'Questions could not be loaded.';

  @override
  String get temperatureStepWhenHeading => 'When?';

  @override
  String get temperatureStepWait30Minutes =>
      'Wait 30 minutes after eating, drinking, or exercising';

  @override
  String get temperatureStepWait6Hours =>
      'Wait at least 6 hours after taking medicines that can lower your temperature (like Acetaminophen, Paracetamol, Ibuprofen, and Aspirin)';

  @override
  String get temperatureStepHowHeading => 'How?';

  @override
  String get temperatureStepPleaseEnterValueBelow =>
      'Please enter a value below 150 ℉';

  @override
  String get temperatureStepPleaseEnterValueAbove =>
      'Please enter a value above 70 ℉';

  @override
  String get temperatureStepHowToDialogTitle => 'Taking your Temperature';

  @override
  String get temperatureStepTemperatureOutOfRangeError =>
      'Please enter a valid temperature value.';

  @override
  String get temperatureStepTemperatureLabel => 'Temperature';

  @override
  String get temperatureStepHowToDialogStep1 =>
      'Wash your hands using soap and water';

  @override
  String get temperatureStepHowToDialogStep2 =>
      'Wash the tip of your thermometer using soap and warm water or rubbing alcohol. Rinse.';

  @override
  String get temperatureStepHowToDialogStep3 =>
      'Put the tip of your thermometer under your tongue and gently close your lips.';

  @override
  String get temperatureStepHowToDialogStep4 =>
      'Keep your lips closed and the thermometer under your tongue until you hear a beep.';

  @override
  String get temperatureStepHowToDialogStep5 =>
      'Take out your thermometer and record your temperature.';

  @override
  String get temperatureStepHowToDialogReturn => 'RETURN TO CHECKUP';

  @override
  String get temperatureStepTitle => 'Take your temperature';

  @override
  String get temperatureStepInputLabel => 'Enter your temperature';

  @override
  String get temperatureStepHelp => 'How to check your temperature';

  @override
  String get locationStepTitle => 'Enter your location';

  @override
  String get locationStepInvalidZipCode => 'Please enter a valid USPS ZIP code';

  @override
  String get locationStepInvalidCountry =>
      'Please just enter the name of your country';

  @override
  String get locationStepZipCode => '5-Digit ZIP Code';

  @override
  String get locationStepCountryHelper =>
      'If you are not in the US, what is your country?';

  @override
  String get locationStepInUSA => 'In the United States';

  @override
  String get locationStepAnotherCountry => 'In another country';

  @override
  String get locationStepCountry => 'Country';

  @override
  String get homeScreenHeading => 'Concerned about your health?';

  @override
  String get homeScreenDoYouHaveSymptoms =>
      'Are you experiencing symptoms? Have you been in contact with someone who is infected?';

  @override
  String get homeScreenCheckupButtonLabel => 'START HEALTH CHECKUP';

  @override
  String get homeScreenYouHaveCompletedCheckup =>
      'You have completed your checkup for today!';

  @override
  String get homeScreenCheckBackTomorrow =>
      'If you continue to experience symptoms, please check back tomorrow.';

  @override
  String get homeScreenViewMyAssessment => 'View my assessment';

  @override
  String get shareAppDownloadPrompt =>
      'Worried that you might have COVID-19? Download this app to check up on your health and support your community: APP_LINK';

  @override
  String get shareAppProtectYourCommunity => 'Protect Your Community';

  @override
  String get shareAppWithFriendsEtc =>
      'Share this app with your friends, coworkers, and family (especially grandparents).';

  @override
  String get shareAppNow => 'SHARE NOW';

  @override
  String get staySafeTitle => 'Stay Safe';

  @override
  String get staySafeWashYourHands => 'Wash your hands';

  @override
  String get staySafeLimitContact => 'Limit contact with other people.';

  @override
  String get staySafeCheckBackIf =>
      'Check back in if you continue to experience symptoms.';

  @override
  String get tutorialIntroStepWelcome => 'Welcome to the CovidNearMe App';

  @override
  String get tutorialIntroStepCompleteACheckup =>
      'Complete a daily health checkup.';

  @override
  String get tutorialIntroStepReceiveAssessment =>
      'Receive a personalized health assessment.';

  @override
  String get tutorialIntroStepAidEffort => 'Aid COVID-19 response efforts.';

  @override
  String get tutorialIntroStepLearnMore => 'LEARN MORE';

  @override
  String get getStartedStepJoined =>
      'You\'ve joined the CovidNearMe community!';

  @override
  String get consentStepDidNotAgree => 'DID NOT AGREE';

  @override
  String get consentStepNo => 'NO';

  @override
  String get consentStepAgreed => 'AGREED';

  @override
  String get consentStepIAgree => 'I AGREE';

  @override
  String get consentStepLoading => 'Loading...';

  @override
  String get networkUnavailableBannerContinueOffline => 'CONTINUE OFFLINE';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'CONNECT TO WIFI';

  @override
  String get networkUnavailableBannerMessage =>
      'You seem to be offline. Please check your network settings and try again.';

  @override
  String get deniedConsentBackButton =>
      'Go back to the informed consent screen';

  @override
  String get questionShortnessOfBreathTitle =>
      'Are you experiencing shortness of breath?';

  @override
  String get questionShortnessOfBreathSubtitle =>
      'Do you feel like you can\'t get enough air?';

  @override
  String get questionShortnessOfBreathAnswer0 => 'None';

  @override
  String get questionShortnessOfBreathAnswer1 => 'Mild';

  @override
  String get questionShortnessOfBreathAnswer2 => 'Moderate';

  @override
  String get questionShortnessOfBreathAnswer3 => 'Severe';

  @override
  String get questionShortnessOfBreathSemantics0 => 'No shortness of breath';

  @override
  String get questionShortnessOfBreathSemantics1 => 'Mild shortness of breath';

  @override
  String get questionShortnessOfBreathSemantics2 =>
      'Moderate shortness of breath';

  @override
  String get questionShortnessOfBreathSemantics3 =>
      'Severe shortness of breath';

  @override
  String get questionHaveACoughTitle => 'Do you have a cough?';

  @override
  String get questionHaveACoughAnswer0 => 'None';

  @override
  String get questionHaveACoughAnswer1 => 'Mild';

  @override
  String get questionHaveACoughAnswer2 => 'Moderate';

  @override
  String get questionHaveACoughAnswer3 => 'Uncontrollable - It hurts!';

  @override
  String get questionHaveACoughSemantics0 => 'No cough';

  @override
  String get questionHaveACoughSemantics1 => 'Mild cough';

  @override
  String get questionHaveACoughSemantics2 => 'Moderate cough';

  @override
  String get questionHaveACoughSemantics3 => 'Uncontrollable cough';

  @override
  String get questionHaveNauseaTitle =>
      'Do you feel nauseous, like you might throw up or wish you could?';

  @override
  String get questionHaveNauseaAnswer0 => 'None';

  @override
  String get questionHaveNauseaAnswer1 => 'Mild';

  @override
  String get questionHaveNauseaAnswer2 => 'Moderate';

  @override
  String get questionHaveNauseaAnswer3 => 'Severe';

  @override
  String get questionHaveNauseaSemantics0 => 'No nausea';

  @override
  String get questionHaveNauseaSemantics1 => 'Mild nausea';

  @override
  String get questionHaveNauseaSemantics2 => 'Moderate nausea';

  @override
  String get questionHaveNauseaSemantics3 => 'Severe nausea';

  @override
  String get questionHaveAFeverTitle =>
      'Have you felt like you\'ve had a fever today?';

  @override
  String get questionHaveAFeverAnswer0 => 'No';

  @override
  String get questionHaveAFeverAnswer1 => 'Maybe';

  @override
  String get questionHaveAFeverAnswer2 => 'Severe - I\'m burning up';

  @override
  String get questionHaveAFeverSemantics0 => 'No fever';

  @override
  String get questionHaveAFeverSemantics1 => 'May have a fever';

  @override
  String get questionHaveAFeverSemantics2 => 'Severe fever, I\'m burning up';

  @override
  String get scrollMoreIndicatorMessage => 'SCROLL FOR MORE';

  @override
  String get locationStepNoCountrySelected => 'None selected';

  @override
  String get countryCodeAD => 'Andorra';

  @override
  String get countryCodeAE => 'United Arab Emirates';

  @override
  String get countryCodeAF => 'Afghanistan';

  @override
  String get countryCodeAG => 'Antigua and Barbuda';

  @override
  String get countryCodeAI => 'Anguilla';

  @override
  String get countryCodeAL => 'Albania';

  @override
  String get countryCodeAM => 'Armenia';

  @override
  String get countryCodeAO => 'Angola';

  @override
  String get countryCodeAQ => 'Antarctica';

  @override
  String get countryCodeAR => 'Argentina';

  @override
  String get countryCodeAS => 'American Samoa';

  @override
  String get countryCodeAT => 'Austria';

  @override
  String get countryCodeAU => 'Australia';

  @override
  String get countryCodeAW => 'Aruba';

  @override
  String get countryCodeAX => 'Åland Islands';

  @override
  String get countryCodeAZ => 'Azerbaijan';

  @override
  String get countryCodeBA => 'Bosnia and Herzegovina';

  @override
  String get countryCodeBB => 'Barbados';

  @override
  String get countryCodeBD => 'Bangladesh';

  @override
  String get countryCodeBE => 'Belgium';

  @override
  String get countryCodeBF => 'Burkina Faso';

  @override
  String get countryCodeBG => 'Bulgaria';

  @override
  String get countryCodeBH => 'Bahrain';

  @override
  String get countryCodeBI => 'Burundi';

  @override
  String get countryCodeBJ => 'Benin';

  @override
  String get countryCodeBL => 'Saint Barthélemy';

  @override
  String get countryCodeBM => 'Bermuda';

  @override
  String get countryCodeBN => 'Brunei Darussalam';

  @override
  String get countryCodeBO => 'Bolivia (Plurinational State of)';

  @override
  String get countryCodeBQ => 'Bonaire, Sint Eustatius and Saba';

  @override
  String get countryCodeBR => 'Brazil';

  @override
  String get countryCodeBS => 'Bahamas';

  @override
  String get countryCodeBT => 'Bhutan';

  @override
  String get countryCodeBV => 'Bouvet Island';

  @override
  String get countryCodeBW => 'Botswana';

  @override
  String get countryCodeBY => 'Belarus';

  @override
  String get countryCodeBZ => 'Belize';

  @override
  String get countryCodeCA => 'Canada';

  @override
  String get countryCodeCC => 'Cocos (Keeling) Islands';

  @override
  String get countryCodeCD => 'Congo, Democratic Republic of the';

  @override
  String get countryCodeCF => 'Central African Republic';

  @override
  String get countryCodeCG => 'Congo';

  @override
  String get countryCodeCH => 'Switzerland';

  @override
  String get countryCodeCI => 'Côte d\'Ivoire';

  @override
  String get countryCodeCK => 'Cook Islands';

  @override
  String get countryCodeCL => 'Chile';

  @override
  String get countryCodeCM => 'Cameroon';

  @override
  String get countryCodeCN => 'China';

  @override
  String get countryCodeCO => 'Colombia';

  @override
  String get countryCodeCR => 'Costa Rica';

  @override
  String get countryCodeCU => 'Cuba';

  @override
  String get countryCodeCV => 'Cabo Verde';

  @override
  String get countryCodeCW => 'Curaçao';

  @override
  String get countryCodeCX => 'Christmas Island';

  @override
  String get countryCodeCY => 'Cyprus';

  @override
  String get countryCodeCZ => 'Czechia';

  @override
  String get countryCodeDE => 'Germany';

  @override
  String get countryCodeDJ => 'Djibouti';

  @override
  String get countryCodeDK => 'Denmark';

  @override
  String get countryCodeDM => 'Dominica';

  @override
  String get countryCodeDO => 'Dominican Republic';

  @override
  String get countryCodeDZ => 'Algeria';

  @override
  String get countryCodeEC => 'Ecuador';

  @override
  String get countryCodeEE => 'Estonia';

  @override
  String get countryCodeEG => 'Egypt';

  @override
  String get countryCodeEH => 'Western Sahara';

  @override
  String get countryCodeER => 'Eritrea';

  @override
  String get countryCodeES => 'Spain';

  @override
  String get countryCodeET => 'Ethiopia';

  @override
  String get countryCodeFI => 'Finland';

  @override
  String get countryCodeFJ => 'Fiji';

  @override
  String get countryCodeFK => 'Falkland Islands (Malvinas)';

  @override
  String get countryCodeFM => 'Micronesia (Federated States of)';

  @override
  String get countryCodeFO => 'Faroe Islands';

  @override
  String get countryCodeFR => 'France';

  @override
  String get countryCodeGA => 'Gabon';

  @override
  String get countryCodeGB => 'United Kingdom';

  @override
  String get countryCodeGD => 'Grenada';

  @override
  String get countryCodeGE => 'Georgia';

  @override
  String get countryCodeGF => 'French Guiana';

  @override
  String get countryCodeGG => 'Guernsey';

  @override
  String get countryCodeGH => 'Ghana';

  @override
  String get countryCodeGI => 'Gibraltar';

  @override
  String get countryCodeGL => 'Greenland';

  @override
  String get countryCodeGM => 'Gambia';

  @override
  String get countryCodeGN => 'Guinea';

  @override
  String get countryCodeGP => 'Guadeloupe';

  @override
  String get countryCodeGQ => 'Equatorial Guinea';

  @override
  String get countryCodeGR => 'Greece';

  @override
  String get countryCodeGS => 'South Georgia and the South Sandwich Islands';

  @override
  String get countryCodeGT => 'Guatemala';

  @override
  String get countryCodeGU => 'Guam';

  @override
  String get countryCodeGW => 'Guinea-Bissau';

  @override
  String get countryCodeGY => 'Guyana';

  @override
  String get countryCodeHK => 'Hong Kong';

  @override
  String get countryCodeHM => 'Heard Island and McDonald Islands';

  @override
  String get countryCodeHN => 'Honduras';

  @override
  String get countryCodeHR => 'Croatia';

  @override
  String get countryCodeHT => 'Haiti';

  @override
  String get countryCodeHU => 'Hungary';

  @override
  String get countryCodeID => 'Indonesia';

  @override
  String get countryCodeIE => 'Ireland';

  @override
  String get countryCodeIL => 'Israel';

  @override
  String get countryCodeIM => 'Isle of Man';

  @override
  String get countryCodeIN => 'India';

  @override
  String get countryCodeIO => 'British Indian Ocean Territory';

  @override
  String get countryCodeIQ => 'Iraq';

  @override
  String get countryCodeIR => 'Iran (Islamic Republic of)';

  @override
  String get countryCodeIS => 'Iceland';

  @override
  String get countryCodeIT => 'Italy';

  @override
  String get countryCodeJE => 'Jersey';

  @override
  String get countryCodeJM => 'Jamaica';

  @override
  String get countryCodeJO => 'Jordan';

  @override
  String get countryCodeJP => 'Japan';

  @override
  String get countryCodeKE => 'Kenya';

  @override
  String get countryCodeKG => 'Kyrgyzstan';

  @override
  String get countryCodeKH => 'Cambodia';

  @override
  String get countryCodeKI => 'Kiribati';

  @override
  String get countryCodeKM => 'Comoros';

  @override
  String get countryCodeKN => 'Saint Kitts and Nevis';

  @override
  String get countryCodeKP => 'Korea (Democratic People\'s Republic of)';

  @override
  String get countryCodeKR => 'Korea, Republic of';

  @override
  String get countryCodeKW => 'Kuwait';

  @override
  String get countryCodeKY => 'Cayman Islands';

  @override
  String get countryCodeKZ => 'Kazakhstan';

  @override
  String get countryCodeLA => 'Lao People\'s Democratic Republic';

  @override
  String get countryCodeLB => 'Lebanon';

  @override
  String get countryCodeLC => 'Saint Lucia';

  @override
  String get countryCodeLI => 'Liechtenstein';

  @override
  String get countryCodeLK => 'Sri Lanka';

  @override
  String get countryCodeLR => 'Liberia';

  @override
  String get countryCodeLS => 'Lesotho';

  @override
  String get countryCodeLT => 'Lithuania';

  @override
  String get countryCodeLU => 'Luxembourg';

  @override
  String get countryCodeLV => 'Latvia';

  @override
  String get countryCodeLY => 'Libya';

  @override
  String get countryCodeMA => 'Morocco';

  @override
  String get countryCodeMC => 'Monaco';

  @override
  String get countryCodeMD => 'Moldova, Republic of';

  @override
  String get countryCodeME => 'Montenegro';

  @override
  String get countryCodeMF => 'Saint Martin (French part)';

  @override
  String get countryCodeMG => 'Madagascar';

  @override
  String get countryCodeMH => 'Marshall Islands';

  @override
  String get countryCodeMK => 'North Macedonia';

  @override
  String get countryCodeML => 'Mali';

  @override
  String get countryCodeMM => 'Myanmar';

  @override
  String get countryCodeMN => 'Mongolia';

  @override
  String get countryCodeMO => 'Macao';

  @override
  String get countryCodeMP => 'Northern Mariana Islands';

  @override
  String get countryCodeMQ => 'Martinique';

  @override
  String get countryCodeMR => 'Mauritania';

  @override
  String get countryCodeMS => 'Montserrat';

  @override
  String get countryCodeMT => 'Malta';

  @override
  String get countryCodeMU => 'Mauritius';

  @override
  String get countryCodeMV => 'Maldives';

  @override
  String get countryCodeMW => 'Malawi';

  @override
  String get countryCodeMX => 'Mexico';

  @override
  String get countryCodeMY => 'Malaysia';

  @override
  String get countryCodeMZ => 'Mozambique';

  @override
  String get countryCodeNA => 'Namibia';

  @override
  String get countryCodeNC => 'New Caledonia';

  @override
  String get countryCodeNE => 'Niger';

  @override
  String get countryCodeNF => 'Norfolk Island';

  @override
  String get countryCodeNG => 'Nigeria';

  @override
  String get countryCodeNI => 'Nicaragua';

  @override
  String get countryCodeNL => 'Netherlands';

  @override
  String get countryCodeNO => 'Norway';

  @override
  String get countryCodeNP => 'Nepal';

  @override
  String get countryCodeNR => 'Nauru';

  @override
  String get countryCodeNU => 'Niue';

  @override
  String get countryCodeNZ => 'New Zealand';

  @override
  String get countryCodeOM => 'Oman';

  @override
  String get countryCodePA => 'Panama';

  @override
  String get countryCodePE => 'Peru';

  @override
  String get countryCodePF => 'French Polynesia';

  @override
  String get countryCodePG => 'Papua New Guinea';

  @override
  String get countryCodePH => 'Philippines';

  @override
  String get countryCodePK => 'Pakistan';

  @override
  String get countryCodePL => 'Poland';

  @override
  String get countryCodePM => 'Saint Pierre and Miquelon';

  @override
  String get countryCodePN => 'Pitcairn';

  @override
  String get countryCodePR => 'Puerto Rico';

  @override
  String get countryCodePS => 'Palestine, State of';

  @override
  String get countryCodePT => 'Portugal';

  @override
  String get countryCodePW => 'Palau';

  @override
  String get countryCodePY => 'Paraguay';

  @override
  String get countryCodeQA => 'Qatar';

  @override
  String get countryCodeRE => 'Réunion';

  @override
  String get countryCodeRO => 'Romania';

  @override
  String get countryCodeRS => 'Serbia';

  @override
  String get countryCodeRU => 'Russian Federation';

  @override
  String get countryCodeRW => 'Rwanda';

  @override
  String get countryCodeSA => 'Saudi Arabia';

  @override
  String get countryCodeSB => 'Solomon Islands';

  @override
  String get countryCodeSC => 'Seychelles';

  @override
  String get countryCodeSD => 'Sudan';

  @override
  String get countryCodeSE => 'Sweden';

  @override
  String get countryCodeSG => 'Singapore';

  @override
  String get countryCodeSH => 'Saint Helena Ascension Tristan da Cunha';

  @override
  String get countryCodeSI => 'Slovenia';

  @override
  String get countryCodeSJ => 'Svalbard and Jan Mayen';

  @override
  String get countryCodeSK => 'Slovakia';

  @override
  String get countryCodeSL => 'Sierra Leone';

  @override
  String get countryCodeSM => 'San Marino';

  @override
  String get countryCodeSN => 'Senegal';

  @override
  String get countryCodeSO => 'Somalia';

  @override
  String get countryCodeSR => 'Suriname';

  @override
  String get countryCodeSS => 'South Sudan';

  @override
  String get countryCodeST => 'Sao Tome and Principe';

  @override
  String get countryCodeSV => 'El Salvador';

  @override
  String get countryCodeSX => 'Sint Maarten (Dutch part)';

  @override
  String get countryCodeSY => 'Syrian Arab Republic';

  @override
  String get countryCodeSZ => 'Eswatini';

  @override
  String get countryCodeTC => 'Turks and Caicos Islands';

  @override
  String get countryCodeTD => 'Chad';

  @override
  String get countryCodeTF => 'French Southern Territories';

  @override
  String get countryCodeTG => 'Togo';

  @override
  String get countryCodeTH => 'Thailand';

  @override
  String get countryCodeTJ => 'Tajikistan';

  @override
  String get countryCodeTK => 'Tokelau';

  @override
  String get countryCodeTL => 'Timor-Leste';

  @override
  String get countryCodeTM => 'Turkmenistan';

  @override
  String get countryCodeTN => 'Tunisia';

  @override
  String get countryCodeTO => 'Tonga';

  @override
  String get countryCodeTR => 'Turkey';

  @override
  String get countryCodeTT => 'Trinidad and Tobago';

  @override
  String get countryCodeTV => 'Tuvalu';

  @override
  String get countryCodeTW => 'Taiwan, Province of China';

  @override
  String get countryCodeTZ => 'Tanzania, United Republic of';

  @override
  String get countryCodeUA => 'Ukraine';

  @override
  String get countryCodeUG => 'Uganda';

  @override
  String get countryCodeUM => 'United States Minor Outlying Islands';

  @override
  String get countryCodeUS => 'United States of America';

  @override
  String get countryCodeUY => 'Uruguay';

  @override
  String get countryCodeUZ => 'Uzbekistan';

  @override
  String get countryCodeVA => 'Holy See';

  @override
  String get countryCodeVC => 'Saint Vincent and the Grenadines';

  @override
  String get countryCodeVE => 'Venezuela (Bolivarian Republic of)';

  @override
  String get countryCodeVG => 'Virgin Islands (British)';

  @override
  String get countryCodeVI => 'Virgin Islands (U.S.)';

  @override
  String get countryCodeVN => 'Viet Nam';

  @override
  String get countryCodeVU => 'Vanuatu';

  @override
  String get countryCodeWF => 'Wallis and Futuna';

  @override
  String get countryCodeWS => 'Samoa';

  @override
  String get countryCodeYE => 'Yemen';

  @override
  String get countryCodeYT => 'Mayotte';

  @override
  String get countryCodeZA => 'South Africa';

  @override
  String get countryCodeZM => 'Zambia';

  @override
  String get countryCodeZW => 'Zimbabwe';
}
