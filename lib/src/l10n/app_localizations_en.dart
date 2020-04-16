
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tutorialIntroStepWelcome => 'Welcome to CovidNearMe';

  @override
  String get tutorialIntroStepDescription => 'Stay up to date with local COVID-19 statistics and help support relief efforts.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel => 'Welcome to the Covid Near Me App';

  @override
  String get tutorialIntroStepLocalStatistics => 'Get local information about COVID-19.';

  @override
  String get tutorialIntroStepSubmitSymptoms => 'Anonymously submit your symptoms.';

  @override
  String get tutorialIntroStepAidEffort => 'Aid COVID-19 response efforts.';

  @override
  String get tutorialIntroStepGetStarted => 'GET STARTED';

  @override
  String get tutorialLocationStepTitle => 'What\'s your current location?';

  @override
  String get brandingCallout => 'Created in partnership with:';

  @override
  String get homeMenuTooltip => 'More';

  @override
  String get homeMenuAbout => 'About CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'About Covid Near Me';

  @override
  String get aboutBoxDescription => '''This app is developed as an open source project by the Coronavirus Diary community. To learn more and view the source code, please visit the link below.

''';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary on GitHub';

  @override
  String get homeScreenLocalStatisticsTitle => 'Get local COVID-19 news and information';

  @override
  String get homeScreenLocalStatisticsSubtitle => 'See statistics and get up-to-date information on your community';

  @override
  String get homeScreenLocalStatisticsButton => 'GET STARTED';

  @override
  String get homeScreenReportSymptomsTitle => 'Record your symptoms';

  @override
  String get homeScreenReportSymptomsSubtitle => 'Quick and easy health check-in';

  @override
  String get homeScreenReportSymptomsButton => 'GET STARTED';

  @override
  String get homeScreenShareAppTitle => 'Help protect your community by sharing the app';

  @override
  String get homeScreenShareAppSubtitle => 'Share the app with friends and family and keep your community healthy';

  @override
  String get homeScreenShareAppButton => 'SHARE';

  @override
  String get symptomReportLoading => 'Loading';

  @override
  String get symptomReportErrorRetrievingExperience => 'There was an error and the symptom questions could not be loaded. Please try again later.';

  @override
  String get symptomReportTitle => 'Record your symptoms';

  @override
  String symptomReportProgressBarPercentCompleteText(int stepIndex, int stepCount) {
    final intl.NumberFormat stepIndexNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String stepIndexString = stepIndexNumberFormat.format(stepIndex);
    final intl.NumberFormat stepCountNumberFormat = intl.NumberFormat.compactLong(
      locale: localeName,
      
    );
    final String stepCountString = stepCountNumberFormat.format(stepCount);

    return 'Step ${stepIndexString} of ${stepCountString}';
  }

  @override
  String get symptomReportSubmitButton => 'SUBMIT';

  @override
  String get symptomReportNextButton => 'CONTINUE';

  @override
  String get symptomReportAnswerAllQuestions => 'Please answer all the questions to continue';

  @override
  String get symptomReportIntroStepTitle => 'Record your symptoms';

  @override
  String get symptomReportIntroStepHealthQuestions => 'Answer a few simple questions about your health to start tracking your symptoms.';

  @override
  String get symptomReportIntroStepDataContribution => 'Your answers are anonymous and will be used to help aid COVID-19 response efforts. Experts will use your anonymous information to predict and improve disease responses.';

  @override
  String get symptomReportIntroStepStartButton => 'GET STARTED';

  @override
  String get consentStepQuestion => '''# Informed Consent

Since the US has been short on test kits, we are trying to figure out how many people have symptoms that could be due to COVID-19. The information gathered from this app will help predict where hospitals will be under the most strain. Hopefully, doctors and supplies can then be sent to the right places.

You are anonymous. We don’t want to know who you are! We will ask for your zip code to count cases around specific hospitals. Your symptom severity will be used to guess how likely it is that you have COVID-19, and to see how many people in your region are becoming severely sick.

Total daily cases for zip codes will be provided to state and local health authorities, the CDC, and the US Government to help predict which communities need the most support. We will also make a map here on this app. Data will also be analyzed for geographic trends. For example, we might see fewer cases in areas that closed schools for a long time, or perhaps we will see that the epidemic slows down in hot weather.

You can come back later and enter new information on a different day. We will know it’s you and won’t count you twice. Maybe you feel a lot worse, or you got a COVID-19 test result and would like to let us know.

We will not sell this data. It will only be used for public health and research and deleted after the epidemic has run its course.

If this is all OK and you are 18 years old or older, please click \"I agree\". Otherwise, click \"I don\'t agree\".''';

  @override
  String get consentStepDecline => 'I DON\'T AGREE';

  @override
  String get consentStepDeclineActive => 'I DID NOT AGREE';

  @override
  String get consentStepAgree => 'I AGREE';

  @override
  String get consentStepAgreeActive => 'I AGREED';

  @override
  String get deniedConsentHeading => 'CovidNearMe can\'t collect information without your consent';

  @override
  String get deniedConsentMessage => 'If you change your mind, you can use the app at any time. You’ll be asked a couple of questions about your current symptoms and if you’ve been tested for COVID-19. Your information will be used anonymously to help support COVID-19 response efforts.';

  @override
  String get deniedConsentSafetyTipsButton => 'GET TIPS FOR STAYING HEALTHY';

  @override
  String get symptomReportLocationStepTitle => 'What\'s your current location?';

  @override
  String get questionsStepQuestionsLoadedError => 'Questions could not be loaded.';

  @override
  String get systemReportSubmitting => 'Submitting your symptoms';

  @override
  String get systemReportBackToHomePage => 'Go back to the home page';

  @override
  String get thankYouScreenTitle => 'Thank you for sharing your symptoms to support disease response efforts!';

  @override
  String get thankYouScreenFinishButton => 'FINISH';

  @override
  String get thankYouScreenCallToAction => 'If you continue to feel symptoms tomorrow, record your symptoms again in the app.';

  @override
  String get thankYouScreenSeriousSymptoms => 'If your symptoms worsen, contact your healthcare provider.';

  @override
  String get thankYouScreenSafetyTipsButton => 'SAFETY TIPS';

  @override
  String get thankYouScreenShareAppButton => 'SHARE THE APP';

  @override
  String get questionShortnessOfBreathTitle => 'Are you experiencing shortness of breath?';

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
  String get questionShortnessOfBreathSemantics2 => 'Moderate shortness of breath';

  @override
  String get questionShortnessOfBreathSemantics3 => 'Severe shortness of breath';

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
  String get questionHaveNauseaTitle => 'Do you feel nauseous, like you might throw up or wish you could?';

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
  String get questionHaveAFeverTitle => 'Have you felt like you\'ve had a fever today?';

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
  String get questionHowHighWasYourFever => 'How high did your temperature get today (if you took it)?';

  @override
  String get questionHaveYouBeenFluTestedTitle => 'Have you been tested for flu, pneumonia, or other respiratory illness?';

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
  String get questionTryForTestingTitle => 'Did you try to get tested for COVID-19?';

  @override
  String get questionTryForTestingSemantics0 => 'Yes, I tried to get tested for COVID-19.';

  @override
  String get questionTryForTestingSemantics1 => 'No, I didn\'t try to get tested for COVID-19.';

  @override
  String get questionCovid19TestResultTitle => 'What was the result?';

  @override
  String get questionCovid19TestResultAnswer0 => 'Negative, I don\'t have COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => 'Positive, I have COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => 'I don\'t know yet';

  @override
  String get questionCovid19TestResultAnswer3 => 'The clinic didn\'t have tests';

  @override
  String get questionCovid19TestResultAnswer4 => 'I was turned away because I wasn\'t sick enough';

  @override
  String get temperatureFieldHelpButton => 'NEED HELP? TAP FOR INSTRUCTIONS';

  @override
  String get temperatureFieldOutOfRangeError => 'Please enter a valid temperature value.';

  @override
  String get temperatureDialogTitle => 'When and how to take your temperature';

  @override
  String get temperatureDialogWhenHeading => 'When?';

  @override
  String get temperatureDialogWait30Minutes => 'Wait 30 minutes after eating, drinking, or exercising.';

  @override
  String get temperatureDialogWait6Hours => 'Wait at least 6 hours after taking medicines that can lower your temperature (like Acetaminophen, Paracetamol, Ibuprofen, and Aspirin).';

  @override
  String get temperatureDialogHowHeading => 'How?';

  @override
  String get temperatureDialogStep1 => 'Wash your hands using soap and water.';

  @override
  String get temperatureDialogStep2 => 'Wash the tip of your thermometer using soap and warm water or rubbing alcohol. Rinse.';

  @override
  String get temperatureDialogStep3 => 'Put the tip of your thermometer under your tongue and gently close your lips.';

  @override
  String get temperatureDialogStep4 => 'Keep your lips closed and the thermometer under your tongue until you hear a beep.';

  @override
  String get temperatureDialogStep5 => 'Take out your thermometer and record your temperature.';

  @override
  String get temperatureDialogCloseButton => 'CLOSE';

  @override
  String get shareAppDownloadPrompt => 'Download CovidNearMe to get local COVID-19 information and statistics. Support your community by contributing your symptoms anonymously! {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => 'How to stay healthy';

  @override
  String get safetyTipsSubtitle => 'Effective ways to protect your health and help your community stop the spread of disease.';

  @override
  String get safetyTipsWashYourHands => 'Wash your hands frequently for at least 20 seconds using soap and water. Avoid touching your eyes, nose, and mouth, especially in public. Always cover your coughs and sneezes with the inside of your elbow.';

  @override
  String get safetyTipsSocialDistancing => 'Practice social distancing, which means limiting contact with other people. Maintain at least 6 feet of distance between yourself and others when you\'re outside of your home.';

  @override
  String get safetyTipsContactPhysician => 'If your symptoms worsen, contact a healthcare provider.';

  @override
  String get locationStepTitle => 'Verify your location';

  @override
  String get locationStepInvalidZipCode => 'Please enter a valid 5-digit Zip Code';

  @override
  String get locationStepZipCode => 'Zip Code';

  @override
  String get locationStepNoCountrySelected => 'None selected';

  @override
  String get locationStepCountrySearchPrompt => 'Please select the country where you are located';

  @override
  String get locationStepCountryButtonLabel => 'Country:';

  @override
  String get networkUnavailableBannerContinueOffline => 'CONTINUE OFFLINE';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'CONNECT TO WIFI';

  @override
  String get networkRequestError => 'There was an error and your request could not be completed.';

  @override
  String get networkUnavailableBannerMessage => 'You seem to be offline. Please check your network settings and try again.';

  @override
  String get scrollMoreIndicatorMessage => 'SCROLL FOR MORE';

  @override
  String get localStatisticsTitle => 'Local COVID-19 Statistics';

  @override
  String get localStatisticsNoLocationSelected => 'Select a location to view its statistics.';

  @override
  String get localStatisticsNoDataAvailable => 'No COVID-19 data was found for this location.';

  @override
  String get localStatisticsLocationInput => 'Zip Code or Country';

  @override
  String get localStatisticsRecentLocationsMenuTitle => 'Recent locations';

  @override
  String get statisticsLabelCases => 'Cases';

  @override
  String get statisticsLabelDeaths => 'Deaths';

  @override
  String get statisticsLabelRecoveries => 'Recoveries';
}
