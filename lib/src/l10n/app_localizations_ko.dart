// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get tutorialIntroStepWelcome => 'CovidNearMe에 오신 것을 환영합니다';

  @override
  String get tutorialIntroStepDescription =>
      '거주 지역의 최신 코로나19 통계를 확인하고 대응에 동참해 주세요.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Covid Near Me 앱에 오신 것을 환영합니다';

  @override
  String get tutorialIntroStepLocalStatistics => '거주 지역의 코로나19 관련 정보를 확인하세요.';

  @override
  String get tutorialIntroStepSubmitSymptoms => '익명으로 증상 정보를 제출하세요.';

  @override
  String get tutorialIntroStepAidEffort => '코로나19 대응에 동참해 주세요.';

  @override
  String get tutorialIntroStepGetStarted => '시작하기';

  @override
  String get tutorialLocationStepTitle => '현재 위치';

  @override
  String get brandingCallout => '다음 파트너와 협력하여 제작하였습니다.';

  @override
  String get homeMenuTooltip => '더보기';

  @override
  String get homeMenuAbout => 'CovidNearMe 소개';

  @override
  String get homeMenuAboutSemantics => 'Covid Near Me 소개';

  @override
  String get aboutBoxDescription =>
      '이 앱은 Coronavirus Diary 커뮤니티에서 오픈소스 프로젝트로 개발했습니다. 소스 코드를 자세히 알아보고 확인하려면 다음 링크로 이동하세요.';

  @override
  String get aboutBoxLinkText => 'GitHub의 Coronavirus Diary';

  @override
  String get homeScreenLocalStatisticsTitle => '거주 지역의 코로나19 소식 및 정보 확인하기';

  @override
  String get homeScreenLocalStatisticsSubtitle =>
      '지역사회의 통계를 확인하고 최신 정보를 받아 보세요.';

  @override
  String get homeScreenLocalStatisticsButton => '시작하기';

  @override
  String get homeScreenReportSymptomsTitle => '증상 기록하기';

  @override
  String get homeScreenReportSymptomsSubtitle => '쉽고 빠른 건강 상태 확인';

  @override
  String get homeScreenReportSymptomsButton => '시작하기';

  @override
  String get homeScreenShareAppTitle => '앱을 공유하여 지역사회 보호에 동참하기';

  @override
  String get homeScreenShareAppSubtitle => '친구 및 가족과 앱을 공유하고 지역사회를 건강하게 보호하세요.';

  @override
  String get homeScreenShareAppButton => '공유';

  @override
  String get symptomReportLoading => '로드 중';

  @override
  String get symptomReportErrorRetrievingExperience =>
      '오류로 인해 증상 질문을 로드할 수 없습니다. 나중에 다시 시도해 보세요.';

  @override
  String get symptomReportTitle => '증상 기록하기';

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

    return '${stepIndexString}/${stepCountString}단계';
  }

  @override
  String get symptomReportSubmitButton => '제출';

  @override
  String get symptomReportNextButton => '계속';

  @override
  String get symptomReportAnswerAllQuestions => '계속하려면 모든 질문에 답하세요.';

  @override
  String get symptomReportIntroStepTitle => '증상 기록하기';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      '건강에 관한 몇 가지 간단한 질문에 답하고 증상 추적을 시작하세요.';

  @override
  String get symptomReportIntroStepDataContribution =>
      '답변은 익명으로 제출되어 코로나19 대응을 지원하기 위해 사용됩니다. 전문가들이 이 정보를 활용하여 질병 관련 데이터를 예측하고 대응 노력을 개선합니다.';

  @override
  String get symptomReportIntroStepStartButton => '시작하기';

  @override
  String get consentStepQuestion => '''# 정보 기반 동의

Google에서는 미국 내 진단 검사 키트 공급이 원활하지 않은 현 상황에서 얼마나 많은 사람이 코로나19로 인해 발생할 수 있는 증상을 겪고 있는지 확인하고자 노력하고 있습니다. 이 앱을 통해 수집된 정보는 어느 지역의 병원이 가장 의료 자원 부족에 시달리고 있는지 예측하는 데 도움을 줍니다. 이를 통해 필요한 곳에 의료진 및 장비를 전달할 수 있게 되기를 바랍니다.

정보는 익명으로 제공됩니다. Google에서는 사용자의 신원을 파악하지 않습니다. 다만 특정 병원 주변에서 발생한 의심 환자 수를 집계하기 위해 우편번호를 요청합니다. 증상 강도는 사용자의 코로나19 감염 가능성 및 사용자가 거주하는 지역에 얼마나 많은 중증 환자가 있는지 판단하는 데 사용됩니다.

우편번호별 총 일일 의심 환자 수는 주정부 및 현지 보건 당국, CDC, 미국 정부에서 어떤 지역사회에 가장 많은 지원이 필요한지 예측하는 데 도움을 주기 위해 제공됩니다. 또한 Google에서는 이 앱에 지도를 만들 예정이며, 데이터를 분석해 지리적 동향을 파악할 것입니다. 예를 들어 장기간 학교가 폐쇄된 지역에서 감염자가 적게 발생할 수도 있고, 날씨가 더워지면 바이러스 확산세가 느려질 수도 있습니다.

사용자는 나중에 다시 돌아와 다른 날짜의 새로운 정보를 입력할 수 있습니다. Google에서는 데이터 중복이 발생하지 않도록 사용자를 확인합니다. 증세가 매우 나빠지거나 코로나19 진단 검사 결과를 받은 후 이를 알리고 싶을 수도 있습니다.

Google에서는 이 데이터를 판매하지 않습니다. 이 데이터는 공중 보건 및 연구용으로만 사용되며 코로나19 사태가 종식된 후 삭제됩니다.

이 사항에 모두 동의하며 만 18세 이상인 경우 \'동의\'를 클릭하세요. 그렇지 않은 경우 \'동의 안함\'을 클릭하세요.''';

  @override
  String get consentStepDecline => '동의 안함';

  @override
  String get consentStepDeclineActive => '동의하지 않음';

  @override
  String get consentStepAgree => '동의';

  @override
  String get consentStepAgreeActive => '동의함';

  @override
  String get deniedConsentHeading => 'CovidNearMe에서는 사용자의 동의 없이 정보를 수집할 수 없습니다';

  @override
  String get deniedConsentMessage =>
      '나중에라도 언제든지 앱을 사용할 수 있습니다. 현재 증상에 관한 몇 가지 질문 및 코로나19 진단 검사 여부에 답해야 합니다. 이 정보는 익명으로 처리되며 코로나19 대응을 지원하기 위해 사용됩니다.';

  @override
  String get deniedConsentSafetyTipsButton => '건강한 생활을 위한 팁';

  @override
  String get symptomReportLocationStepTitle => '현재 위치';

  @override
  String get questionsStepQuestionsLoadedError => '질문을 로드할 수 없습니다.';

  @override
  String get systemReportSubmitting => '증상 제출';

  @override
  String get systemReportBackToHomePage => '홈페이지로 돌아가기';

  @override
  String get thankYouScreenTitle => '증상을 공유하여 질병 대응에 동참해 주셔서 감사합니다.';

  @override
  String get thankYouScreenFinishButton => '완료';

  @override
  String get thankYouScreenCallToAction => '내일도 증상이 있다면 앱에서 다시 증상을 기록해 주세요.';

  @override
  String get thankYouScreenSeriousSymptoms => '증상이 악화되는 경우 가까운 병원에 문의하세요.';

  @override
  String get thankYouScreenSafetyTipsButton => '안전 관련 팁';

  @override
  String get thankYouScreenShareAppButton => '앱 공유하기';

  @override
  String get questionShortnessOfBreathTitle => '호흡 곤란이 나타나나요?';

  @override
  String get questionShortnessOfBreathAnswer0 => '없음';

  @override
  String get questionShortnessOfBreathAnswer1 => '약간';

  @override
  String get questionShortnessOfBreathAnswer2 => '중간';

  @override
  String get questionShortnessOfBreathAnswer3 => '심각';

  @override
  String get questionShortnessOfBreathSemantics0 => '호흡 곤란 없음';

  @override
  String get questionShortnessOfBreathSemantics1 => '약간의 호흡 곤란';

  @override
  String get questionShortnessOfBreathSemantics2 => '중간 정도의 호흡 곤란';

  @override
  String get questionShortnessOfBreathSemantics3 => '심각한 호흡 곤란';

  @override
  String get questionHaveACoughTitle => '기침이 있나요?';

  @override
  String get questionHaveACoughAnswer0 => '없음';

  @override
  String get questionHaveACoughAnswer1 => '약간';

  @override
  String get questionHaveACoughAnswer2 => '중간';

  @override
  String get questionHaveACoughAnswer3 => '멈출 수 없음 - 통증 발생';

  @override
  String get questionHaveACoughSemantics0 => '기침 없음';

  @override
  String get questionHaveACoughSemantics1 => '약간의 기침';

  @override
  String get questionHaveACoughSemantics2 => '중간 정도의 기침';

  @override
  String get questionHaveACoughSemantics3 => '기침을 멈출 수 없음';

  @override
  String get questionHaveNauseaTitle => '토할 것 같거나 토하고 싶을 정도의 메스꺼움이 있나요?';

  @override
  String get questionHaveNauseaAnswer0 => '없음';

  @override
  String get questionHaveNauseaAnswer1 => '약간';

  @override
  String get questionHaveNauseaAnswer2 => '중간';

  @override
  String get questionHaveNauseaAnswer3 => '심각';

  @override
  String get questionHaveNauseaSemantics0 => '메스꺼움 없음';

  @override
  String get questionHaveNauseaSemantics1 => '약간의 메스꺼움';

  @override
  String get questionHaveNauseaSemantics2 => '중간 정도의 메스꺼움';

  @override
  String get questionHaveNauseaSemantics3 => '심각한 메스꺼움';

  @override
  String get questionHaveAFeverTitle => '오늘 열이 있는 것 같다고 느꼈나요?';

  @override
  String get questionHaveAFeverAnswer0 => '아니요';

  @override
  String get questionHaveAFeverAnswer1 => '그런 것 같음';

  @override
  String get questionHaveAFeverAnswer2 => '심각 - 고열 발생';

  @override
  String get questionHaveAFeverSemantics0 => '열 없음';

  @override
  String get questionHaveAFeverSemantics1 => '열이 있는 것 같음';

  @override
  String get questionHaveAFeverSemantics2 => '심각, 고열 발생';

  @override
  String get questionHowHighWasYourFever => '오늘 열을 측정했다면 열이 얼마나 높았나요?';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      '독감 또는 폐렴이나 기타 호흡기 질병 검사를 받은 적이 있나요?';

  @override
  String get questionYes => '예';

  @override
  String get questionNo => '아니요';

  @override
  String get questionFluTestPositiveTitle => '검사 결과가 양성이었나요?';

  @override
  String get questionFluTestPositiveSemantics0 => '예, 검사 결과가 양성이었음';

  @override
  String get questionFluTestPositiveSemantics1 => '아니요, 검사 결과가 음성이었음';

  @override
  String get questionWhatWasPositiveTitle => '어떤 질병이 있었나요?';

  @override
  String get questionTryForTestingTitle => '코로나19 진단 검사를 받아보려고 했나요?';

  @override
  String get questionTryForTestingSemantics0 => '예, 코로나19 진단 검사를 받아보려고 함';

  @override
  String get questionTryForTestingSemantics1 => '아니요, 코로나19 진단 검사를 받으려 한 적이 없음';

  @override
  String get questionCovid19TestResultTitle => '진단 검사 결과는 어떠했나요?';

  @override
  String get questionCovid19TestResultAnswer0 => '음성, 코로나19 확진을 받지 않음';

  @override
  String get questionCovid19TestResultAnswer1 => '양성, 코로나19 확진을 받음';

  @override
  String get questionCovid19TestResultAnswer2 => '아직 모름';

  @override
  String get questionCovid19TestResultAnswer3 => '병원에 진단 검사 키트가 없었음';

  @override
  String get questionCovid19TestResultAnswer4 => '증세가 심각하지 않아 병원에서 거절당함';

  @override
  String get temperatureFieldHelpButton => '도움이 필요하세요? 안내를 보려면 탭하세요.';

  @override
  String get temperatureFieldOutOfRangeError => '올바른 체온 값을 입력하세요.';

  @override
  String get temperatureDialogTitle => '체온을 재는 시기 및 방법';

  @override
  String get temperatureDialogWhenHeading => '시기';

  @override
  String get temperatureDialogWait30Minutes =>
      '식사, 음주, 운동 후에는 30분 후에 체온을 측정 합니다.';

  @override
  String get temperatureDialogWait6Hours =>
      '아세트아미노펜, 파라세타몰, 이부프로펜, 아스피린 등 체온을 낮출 수 있는 약물을 복용한 후 적어도 6시간이 지난 후 체온을 측정합니다.';

  @override
  String get temperatureDialogHowHeading => '방법';

  @override
  String get temperatureDialogStep1 => '비누와 물로 손을 씻습니다.';

  @override
  String get temperatureDialogStep2 =>
      '비누와 따뜻한 물로 체온계 끝을 씻거나 알코올을 문질러 씻어냅니다. 헹굽니다.';

  @override
  String get temperatureDialogStep3 => '혀 밑에 체온계 끝을 넣은 후 입을 살짝 다뭅니다.';

  @override
  String get temperatureDialogStep4 =>
      '혀 밑에 체온계를 넣고 입을 다문 상태로 삐 소리가 날 때까지 기다립니다.';

  @override
  String get temperatureDialogStep5 => '체온계를 뺀 후 체온을 기록합니다.';

  @override
  String get temperatureDialogCloseButton => '닫기';

  @override
  String get shareAppDownloadPrompt =>
      'CovidNearMe를 다운로드하고 거주 지역 코로나19 정보 및 통계를 확인하세요. 증상을 익명으로 제공하고 지역사회를 지키는 데 동참하세요. {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => '건강을 지키는 방법';

  @override
  String get safetyTipsSubtitle =>
      '건강을 지키고 지역사회에서의 전염병 확산을 저지하기 위한 효과적인 방법을 확인하세요.';

  @override
  String get safetyTipsWashYourHands =>
      '비누와 물을 사용해 적어도 20초 동안 자주 손을 씻습니다. 특히 공공장소에서 눈과 코, 입을 만지지 않습니다. 기침하거나 재채기할 때는 항상 팔꿈치 안쪽에 합니다.';

  @override
  String get safetyTipsSocialDistancing =>
      '사회적 거리두기를 실천합니다. 즉, 다른 사람과의 접촉을 피해야 합니다. 집밖에서 다른 사람과 적어도 2m의 거리를 둡니다.';

  @override
  String get safetyTipsContactPhysician => '증상이 악화되는 경우 가까운 병원에 문의하세요.';

  @override
  String get locationStepTitle => '위치 확인하기';

  @override
  String get locationStepInvalidZipCode => '5자리 우편번호를 올바르게 입력하세요.';

  @override
  String get locationStepZipCode => '우편번호';

  @override
  String get locationStepNoCountrySelected => '선택한 항목 없음';

  @override
  String get locationStepCountrySearchPrompt => '거주 국가를 선택하세요.';

  @override
  String get locationStepCountryButtonLabel => '국가:';

  @override
  String get networkUnavailableBannerContinueOffline => '오프라인에서 계속';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'Wi-Fi에 연결';

  @override
  String get networkRequestError => '오류로 인해 요청을 완료할 수 없습니다.';

  @override
  String get networkUnavailableBannerMessage =>
      '오프라인인 것 같습니다. 네트워크 설정을 확인한 다음 다시 시도해 주세요.';

  @override
  String get scrollMoreIndicatorMessage => '스크롤하여 더보기';

  @override
  String get localStatisticsTitle => '거주 지역 코로나19 통계';

  @override
  String get localStatisticsNoLocationSelected => '통계를 확인하려면 위치를 선택하세요.';

  @override
  String get localStatisticsNoDataAvailable => '위치의 코로나19 데이터를 찾을 수 없습니다.';

  @override
  String get localStatisticsLocationInput => '우편번호 또는 국가';

  @override
  String get localStatisticsRecentLocationsMenuTitle => '최근 위치';

  @override
  String get statisticsLabelCases => '감염자';

  @override
  String get statisticsLabelDeaths => '사망자';

  @override
  String get statisticsLabelRecoveries => '완치자';
}
