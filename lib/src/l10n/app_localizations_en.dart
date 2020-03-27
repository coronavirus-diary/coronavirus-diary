// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
}
