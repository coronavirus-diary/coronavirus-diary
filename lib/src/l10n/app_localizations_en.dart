// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeMenuTooltip => 'More';

  @override
  String get homeMenuAbout => 'About CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'About Covid Near Me';

  @override
  String get aboutBoxDescription =>
      '''This app is developed as an open source project by the Coronavirus Diary community. To learn more and view the source code, please visit the link below.

''';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary on GitHub';

  @override
  String get consentStepQuestion => '''# Informed Consent

Since the US has been short on test kits, we are trying to figure out how many people have symptoms that could be due to COVID-19. The information gathered from this app will help predict where hospitals will be under the most strain. Hopefully, doctors and supplies can then be sent to the right places.

You are anonymous. We don’t want to know who you are! We will ask for your zip code to count cases around specific hospitals. Your symptom severity will be used to guess how likely it is that you have COVID-19, and to see how many people in your region are becoming severely sick.

Total daily cases for zip codes will be provided to state and local health authorities, the CDC, and the US Government to help predict which communities need the most support. We will also make a map here on this app. Data will also be analyzed for geographic trends. For example, we might see fewer cases in areas that closed schools for a long time, or perhaps we will see that the epidemic slows down in hot weather.

You can come back later and enter new information on a different day. We will know it’s you and won’t count you twice. Maybe you feel a lot worse, or you got a COVID-19 test result and would like to let us know.

We will not sell this data. It will only be used for public health and research and deleted after the epidemic has run its course.

If this is all OK and you are 18 years old or older, please click \"I agree\". Otherwise, click \"I don\'t agree\".''';

  @override
  String get deniedConsentHeading => 'Consent Declined';

  @override
  String get deniedConsentMessage =>
      'Thank you for considering joining our effort. If you change your mind and decide to consent later, try reporting your symptoms again. You will be asked for your consent again and then you can accept it and enter your symptoms.';

  @override
  String get thankYouScreenTitle => 'Thank you';

  @override
  String get thankYouScreenFinishButton => 'FINISH';

  @override
  String get thankYouScreenDataSubmission =>
      'Thank you for supporting the COVID-19 response effort. Your answers have been anonymously submitted.';

  @override
  String get thankYouScreenCallToAction =>
      'If you continue to experience symptoms, please check in again tomorrow.';

  @override
  String get thankYouScreenSeriousSymptoms =>
      'If they become serious, please consult a physician.';

  @override
  String get thankYouScreenSafetyTipsButton => 'SAFETY TIPS';

  @override
  String get thankYouScreenShareAppButton => 'SHARE THE APP';

  @override
  String get symptomReportLoading => 'Loading the symptom report experience.';

  @override
  String get symptomReportErrorRetrievingExperience =>
      'There was an error retrieving the symptom report experience. Please try again later.';

  @override
  String get symptomReportTitle => 'Report Your Symptoms';

  @override
  String symptomReportProgressBarPercentCompleteText(
      int stepIndex, int stepCount) {
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
  String get symptomReportSubmitButton => 'SUBMIT';

  @override
  String get symptomReportNextButton => 'NEXT';

  @override
  String get symptomReportAnswerAllQuestions =>
      'Please answer all the questions to continue';

  @override
  String get symptomReportIntroStepTitle => 'Report Your Symptoms';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      'You will be asked a few questions about your health.';

  @override
  String get symptomReportIntroStepDataContribution =>
      'Your answers will be anonymously submitted to a secure server and used to inform COVID-19 response efforts by providing medical experts and policy makers with information and predictive models.';

  @override
  String get symptomReportIntroStepStartButton => 'START';

  @override
  String get symptomReportLocationStepTitle =>
      'Confirm the location in which you are experiencing symptoms';

  @override
  String get questionsStepQuestionsLoadedError =>
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
  String get temperatureStepHowToDialogReturn => 'RETURN TO SYMPTOM REPORT';

  @override
  String get temperatureStepHelp => 'HOW TO TAKE YOUR TEMPERATURE';

  @override
  String get tutorialLocationStepTitle => 'What is your location?';

  @override
  String get locationStepTitle => 'Verify your location';

  @override
  String get locationStepInvalidZipCode => 'Please enter a valid USPS ZIP code';

  @override
  String get locationStepZipCode => '5-Digit ZIP Code';

  @override
  String get homeScreenReportSymptomsTitle => 'Report Your Symptoms';

  @override
  String get homeScreenReportSymptomsSubtitle =>
      'Are you feeling sick? Anonymously report your symptoms and aid the COVID-19 response effort.';

  @override
  String get systemReportSubmitting => 'Submitting your report';

  @override
  String get systemReportBackToHomePage => 'Go back to the home page';

  @override
  String get shareAppDownloadPrompt =>
      'Download this app to view local COVID-19 statistics and support the community by anonymously reporting your symptoms: APP_LINK';

  @override
  String get shareAppTitle => 'Support Your Community';

  @override
  String get shareAppWithFriendsEtc =>
      'Share this app with your friends, family, and coworkers.';

  @override
  String get shareAppNow => 'SHARE NOW';

  @override
  String get staySafeTitle => 'Stay Safe';

  @override
  String get staySafeWashYourHands =>
      'Wash your hands frequently and for at least 20 seconds.';

  @override
  String get staySafeLimitContact =>
      'Limit contact with other people. Practice social distancing.';

  @override
  String get staySafeContactPhysician =>
      'Contact a physician if your symptoms become serious.';

  @override
  String get tutorialIntroStepWelcome => 'Welcome to CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      'CovidNearMe lets you view local COVID-19 statistics and submit your symptoms to inform the disease response efforts.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Welcome to the Covid Near Me App';

  @override
  String get tutorialIntroStepLocalStatistics =>
      'Get local information about COVID-19.';

  @override
  String get tutorialIntroStepSubmitSymptoms =>
      'Anonymously submit your symptoms.';

  @override
  String get tutorialIntroStepAidEffort => 'Aid COVID-19 response efforts.';

  @override
  String get tutorialIntroStepGetStarted => 'GET STARTED';

  @override
  String get consentStepDecline => 'I DON\'T AGREE';

  @override
  String get consentStepDeclineActive => 'I DID NOT AGREE';

  @override
  String get consentStepAgree => 'I AGREE';

  @override
  String get consentStepAgreeActive => 'I AGREED';

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
