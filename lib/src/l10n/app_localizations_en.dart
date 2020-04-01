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
  String get deniedConsentHeading => 'Consent Declined';

  @override
  String get deniedConsentMessage =>
      'Thank you for considering joining our effort. If you change your mind, you can come back later.';

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
  String get temperatureStepHelp => 'HOW TO TAKE YOUR TEMPERATURE';

  @override
  String get tutorialLocationStepTitle => 'Enter your location';

  @override
  String get locationStepTitle => 'Verify your location';

  @override
  String get locationStepInvalidZipCode => 'Please enter a valid USPS ZIP code';

  @override
  String get locationStepZipCode => '5-Digit ZIP Code';

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
  String get homeScreenViewMyAssessment => 'VIEW MY ASSESSMENT';

  @override
  String get systemReportLoadingAssessment => 'Loading your assessment';

  @override
  String get systemReportBackToHomePage => 'Go back to the home page';

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
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Welcome to the Covid Near Me App';

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
  String get getStartedStepJoinedSemanticsLabel =>
      'You\'ve joined the Covid Near Me community!';

  @override
  String get consentStepDidNotAgree => 'DID NOT AGREE';

  @override
  String get consentStepNo => 'NO';

  @override
  String get consentStepAgreed => 'AGREED';

  @override
  String get consentStepIAgree => 'I AGREE';

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
  String get questionHowHighWasYourFever =>
      'How high did your temperature get today (if you took it)?';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      'Have you been tested for flu, pneumonia, or other respiratory illness?';

  @override
  String get questionYes => 'Yes';

  @override
  String get questionNo => 'No';

  @override
  String get questionFluTestPositiveTitle => 'Was the test positive?';

  @override
  String get questionFluTestPositiveSemantics0 => 'Yes, the test was positive.';

  @override
  String get questionFluTestPositiveSemantics1 => 'No, the test was negative.';

  @override
  String get questionWhatWasPositiveTitle => 'What did you have?';

  @override
  String get questionTryForTestingTitle =>
      'Did you try to get tested for COVID-19?';

  @override
  String get questionTryForTestingSemantics0 =>
      'Yes, I tried to get tested for COVID-19.';

  @override
  String get questionTryForTestingSemantics1 =>
      'No, I didn\'t try to get tested for COVID-19.';

  @override
  String get questionCovid19TestResultTitle => 'What was the result?';

  @override
  String get questionCovid19TestResultAnswer0 =>
      'Negative, I don\'t have COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => 'Positive, I have COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => 'I don\'t know yet';

  @override
  String get questionCovid19TestResultAnswer3 =>
      'The clinic didn\'t have tests';

  @override
  String get questionCovid19TestResultAnswer4 =>
      'I was turned away because I wasn\'t sick enough';

  @override
  String get scrollMoreIndicatorMessage => 'SCROLL FOR MORE';

  @override
  String get locationStepNoCountrySelected => 'None selected';

  @override
  String get locationStepCountrySearchPrompt =>
      'Please select the country where you are located';

  @override
  String get locationStepCountryButtonLabel => 'Country:';
}
