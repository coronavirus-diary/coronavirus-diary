// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get tutorialIntroStepWelcome => '欢迎使用 CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      '及时了解本地新型冠状病毒肺炎 (COVID-19) 的相关统计信息，为抗疫工作提供支持。';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel => '欢迎使用 Covid Near Me 应用';

  @override
  String get tutorialIntroStepLocalStatistics => '了解本地 COVID-19 相关信息。';

  @override
  String get tutorialIntroStepSubmitSymptoms => '匿名提交您的症状信息。';

  @override
  String get tutorialIntroStepAidEffort => '为 COVID-19 抗疫工作尽一份力。';

  @override
  String get tutorialIntroStepGetStarted => '开始使用';

  @override
  String get tutorialLocationStepTitle => '您目前在什么位置？';

  @override
  String get brandingCallout => '与以下合作伙伴联合推出：';

  @override
  String get homeMenuTooltip => '更多';

  @override
  String get homeMenuAbout => '关于 CovidNearMe';

  @override
  String get homeMenuAboutSemantics => '关于 Covid Near Me';

  @override
  String get aboutBoxDescription =>
      '此应用是 Coronavirus Diary 社区开发的一个开源项目。要了解详情并查看源代码，请访问以下链接。';

  @override
  String get aboutBoxLinkText => '在 GitHub 上查看 Coronavirus Diary';

  @override
  String get homeScreenLocalStatisticsTitle => '获取本地 COVID-19 新闻和信息';

  @override
  String get homeScreenLocalStatisticsSubtitle => '查看统计信息并及时了解您所在社区的最新资讯';

  @override
  String get homeScreenLocalStatisticsButton => '开始使用';

  @override
  String get homeScreenReportSymptomsTitle => '记录您的症状信息';

  @override
  String get homeScreenReportSymptomsSubtitle => '快速轻松地进行健康状况检查';

  @override
  String get homeScreenReportSymptomsButton => '开始使用';

  @override
  String get homeScreenShareAppTitle => '分享此应用，为保护您所在的社区尽一份力';

  @override
  String get homeScreenShareAppSubtitle => '与亲朋好友分享此应用，让您所在的社区远离疫病';

  @override
  String get homeScreenShareAppButton => '分享';

  @override
  String get symptomReportLoading => '正在加载';

  @override
  String get symptomReportErrorRetrievingExperience => '出错了，无法加载症状问题。请稍后重试。';

  @override
  String get symptomReportTitle => '记录您的症状信息';

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

    return '第 ${stepIndexString} 步（共 ${stepCountString} 步）';
  }

  @override
  String get symptomReportSubmitButton => '提交';

  @override
  String get symptomReportNextButton => '继续';

  @override
  String get symptomReportAnswerAllQuestions => '请回答所有问题以继续';

  @override
  String get symptomReportIntroStepTitle => '记录您的症状信息';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      '回答与您的健康状况有关的几个简单的问题，即可开始跟踪您的症状。';

  @override
  String get symptomReportIntroStepDataContribution =>
      '您的回答是匿名的，并将用于协助开展 COVID-19 抗疫工作。专家会利用您的匿名信息来预测并改进抗疫措施。';

  @override
  String get symptomReportIntroStepStartButton => '开始使用';

  @override
  String get consentStepQuestion => '''# 知情同意书

由于美国的检测试剂盒短缺，因此我们希望能够了解有多少人有了可能是因感染 COVID-19 而引起的症状。通过此应用收集的信息有助于预测哪些地区的医院将面临最紧张的抗疫压力。这样一来，我们便能够将医生和相关用品分配到最需要的地点。

您是匿名的。我们不想确定您的身份！我们会要求您提供邮政编码，以便统计特定医院周边的病例数量。我们会利用您的症状严重性数据来猜测您感染 COVID-19 的可能性，并确定您所在的区域有多少人已成为重症患者。

我们会将邮政编码对应的每日病例总数提供给各州和地方的医疗卫生机构、美国疾病控制中心 (CDC) 和美国政府，帮助其预测哪些社区需要最大力度的支持。此外，我们还会在此应用内创建病例分布地图，并对相关数据进行地理趋势分析。例如，在学校长期关闭的地区，病例数量可能会比较少；或者，在天气炎热时，疫情的蔓延速度会降低。

您可以在明天或以后的日期返回此应用并输入新的信息。我们能够验证您的身份，因此不会反复将您计入总数。或许您的症状加剧了，或者您获得了 COVID-19 检测结果并想将结果信息告诉我们。无论怎样，您都可以随时在此应用中输入新的信息。

我们不会销售这些数据。这些数据将仅用于公共卫生和研究用途；疫情结束后，这些数据将被删除。

如果您同意以上所有条件，并已年满 18 周岁，请点击“我同意”。否则，请点击“我不同意”。''';

  @override
  String get consentStepDecline => '我不同意';

  @override
  String get consentStepDeclineActive => '我不同意';

  @override
  String get consentStepAgree => '我同意';

  @override
  String get consentStepAgreeActive => '我同意';

  @override
  String get deniedConsentHeading => 'CovidNearMe 在未经您同意的情况下无法收集信息';

  @override
  String get deniedConsentMessage =>
      '如果您改变了主意，可以随时使用此应用。您需要回答与您目前的症状有关的几个问题，并说明您是否已接受 COVID-19 检测。您的信息将以匿名的方式用于协助开展 COVID-19 抗疫工作。';

  @override
  String get deniedConsentSafetyTipsButton => '获取关于如何保持健康的提示';

  @override
  String get symptomReportLocationStepTitle => '您目前在什么位置？';

  @override
  String get questionsStepQuestionsLoadedError => '无法加载问题。';

  @override
  String get systemReportSubmitting => '正在提交您的症状信息';

  @override
  String get systemReportBackToHomePage => '返回首页';

  @override
  String get thankYouScreenTitle => '感谢您分享自己的症状信息，为抗疫工作尽一份力！';

  @override
  String get thankYouScreenFinishButton => '完成';

  @override
  String get thankYouScreenCallToAction =>
      '如果您明天仍然感觉自己有相关症状，请在此应用中再次记录相关的症状信息。';

  @override
  String get thankYouScreenSeriousSymptoms => '如果您的症状加剧了，请与医疗服务提供方联系。';

  @override
  String get thankYouScreenSafetyTipsButton => '安全提示';

  @override
  String get thankYouScreenShareAppButton => '分享此应用';

  @override
  String get questionShortnessOfBreathTitle => '您是否感到气促？';

  @override
  String get questionShortnessOfBreathAnswer0 => '否';

  @override
  String get questionShortnessOfBreathAnswer1 => '轻度';

  @override
  String get questionShortnessOfBreathAnswer2 => '中度';

  @override
  String get questionShortnessOfBreathAnswer3 => '严重';

  @override
  String get questionShortnessOfBreathSemantics0 => '不气促';

  @override
  String get questionShortnessOfBreathSemantics1 => '轻微气促';

  @override
  String get questionShortnessOfBreathSemantics2 => '中度气促';

  @override
  String get questionShortnessOfBreathSemantics3 => '严重气促（呼吸急促）';

  @override
  String get questionHaveACoughTitle => '您是否咳嗽？';

  @override
  String get questionHaveACoughAnswer0 => '否';

  @override
  String get questionHaveACoughAnswer1 => '轻度';

  @override
  String get questionHaveACoughAnswer2 => '中度';

  @override
  String get questionHaveACoughAnswer3 => '无法抑制 - 疼痛难忍！';

  @override
  String get questionHaveACoughSemantics0 => '不咳嗽';

  @override
  String get questionHaveACoughSemantics1 => '轻度咳嗽';

  @override
  String get questionHaveACoughSemantics2 => '中度咳嗽';

  @override
  String get questionHaveACoughSemantics3 => '无法抑制地咳嗽';

  @override
  String get questionHaveNauseaTitle => '您是否觉得恶心，例如，您可能会呕吐或希望自己能吐出来？';

  @override
  String get questionHaveNauseaAnswer0 => '否';

  @override
  String get questionHaveNauseaAnswer1 => '轻度';

  @override
  String get questionHaveNauseaAnswer2 => '中度';

  @override
  String get questionHaveNauseaAnswer3 => '严重';

  @override
  String get questionHaveNauseaSemantics0 => '不恶心';

  @override
  String get questionHaveNauseaSemantics1 => '轻度恶心';

  @override
  String get questionHaveNauseaSemantics2 => '中度恶心';

  @override
  String get questionHaveNauseaSemantics3 => '严重恶心';

  @override
  String get questionHaveAFeverTitle => '您今天是否觉得自己发烧？';

  @override
  String get questionHaveAFeverAnswer0 => '否';

  @override
  String get questionHaveAFeverAnswer1 => '不确定';

  @override
  String get questionHaveAFeverAnswer2 => '严重 - 我体温很高';

  @override
  String get questionHaveAFeverSemantics0 => '不发烧';

  @override
  String get questionHaveAFeverSemantics1 => '可能发烧';

  @override
  String get questionHaveAFeverSemantics2 => '严重发烧，我体温很高';

  @override
  String get questionHowHighWasYourFever => '您今天的体温有多高（如果您测量过）？';

  @override
  String get questionHaveYouBeenFluTestedTitle => '您是否接受过流感、肺炎或其他呼吸道疾病的检测？';

  @override
  String get questionYes => '是';

  @override
  String get questionNo => '否';

  @override
  String get questionFluTestPositiveTitle => '检测结果是阳性吗？';

  @override
  String get questionFluTestPositiveSemantics0 => '是，检测结果是阳性。';

  @override
  String get questionFluTestPositiveSemantics1 => '否，检测结果是阴性。';

  @override
  String get questionWhatWasPositiveTitle => '您感染的是什么疾病？';

  @override
  String get questionTryForTestingTitle => '您是否尝试过接受 COVID-19 检测？';

  @override
  String get questionTryForTestingSemantics0 => '是，我尝试过接受 COVID-19 检测。';

  @override
  String get questionTryForTestingSemantics1 => '否，我没有尝试过接受 COVID-19 检测。';

  @override
  String get questionCovid19TestResultTitle => '检测结果是什么？';

  @override
  String get questionCovid19TestResultAnswer0 => '阴性，我没有感染 COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => '阳性，我感染了 COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => '我还不知道检测结果';

  @override
  String get questionCovid19TestResultAnswer3 => '诊所没有相关检测项目';

  @override
  String get questionCovid19TestResultAnswer4 => '我被拒绝了，因为我的症状还不够严重';

  @override
  String get temperatureFieldHelpButton => '需要帮助吗？点按以获取说明';

  @override
  String get temperatureFieldOutOfRangeError => '请输入有效的体温值。';

  @override
  String get temperatureDialogTitle => '测量体温的时间和方式';

  @override
  String get temperatureDialogWhenHeading => '何时测量？';

  @override
  String get temperatureDialogWait30Minutes => '吃饭、喝水或运动后等待 30 分钟。';

  @override
  String get temperatureDialogWait6Hours =>
      '服用可以降低体温的药物（例如对乙酰氨基酚、布洛芬和阿司匹林）后等待至少 6 个小时。';

  @override
  String get temperatureDialogHowHeading => '如何测量？';

  @override
  String get temperatureDialogStep1 => '用肥皂和水清洗双手。';

  @override
  String get temperatureDialogStep2 => '用肥皂和温水或医用酒精清洗体温计尖端，然后冲洗。';

  @override
  String get temperatureDialogStep3 => '将体温计的尖端放在舌下，然后轻轻闭上嘴唇。';

  @override
  String get temperatureDialogStep4 => '双唇保持闭合状态，并让体温计在舌下保持不动，直到您听到提示音。';

  @override
  String get temperatureDialogStep5 => '取出体温计并记录体温。';

  @override
  String get temperatureDialogCloseButton => '关闭';

  @override
  String get shareAppDownloadPrompt =>
      '下载 CovidNearMe 以获取本地 COVID-19 信息和统计信息。匿名提供您的症状信息，为您的社区尽一份力！{{ APP_LINK }}';

  @override
  String get safetyTipsTitle => '如何保持健康';

  @override
  String get safetyTipsSubtitle => '保护您的健康以及帮助您的社区阻止疾病传播的有效方式。';

  @override
  String get safetyTipsWashYourHands =>
      '经常使用肥皂和水洗手，每次洗手至少持续 20 秒。避免触摸您的眼睛、鼻子和嘴巴，特别是在公共场合。每次咳嗽和打喷嚏时都应使用手肘内侧遮掩口鼻。';

  @override
  String get safetyTipsSocialDistancing =>
      '注意保持社交距离，也就是说限制与他人的接触。出门在外时，请与他人保持至少 6 英尺的距离。';

  @override
  String get safetyTipsContactPhysician => '如果您的症状加剧了，请与医疗服务提供方联系。';

  @override
  String get locationStepTitle => '验证您的地点';

  @override
  String get locationStepInvalidZipCode => '请输入有效的 5 位数邮政编码';

  @override
  String get locationStepZipCode => '邮政编码';

  @override
  String get locationStepNoCountrySelected => '未选择任何国家/地区';

  @override
  String get locationStepCountrySearchPrompt => '请选择您所在的国家/地区';

  @override
  String get locationStepCountryButtonLabel => '国家/地区：';

  @override
  String get networkUnavailableBannerContinueOffline => '在离线状态下继续使用';

  @override
  String get networkUnavailableBannerConnectToWiFi => '连接到 Wi-Fi 网络';

  @override
  String get networkRequestError => '出了点问题，无法完成您的请求。';

  @override
  String get networkUnavailableBannerMessage => '您似乎处于离线状态。请检查您的网络设置，然后重试。';

  @override
  String get scrollMoreIndicatorMessage => '向下滚动可查看更多内容';

  @override
  String get localStatisticsTitle => '本地 COVID-19 统计信息';

  @override
  String get localStatisticsNoLocationSelected => '选择一个地点以查看相应的统计信息。';

  @override
  String get localStatisticsNoDataAvailable => '未找到此地点的 COVID-19 数据。';

  @override
  String get localStatisticsLocationInput => '邮政编码或国家/地区';

  @override
  String get localStatisticsRecentLocationsMenuTitle => '最近查询的地点';

  @override
  String get statisticsLabelCases => '病例数量';

  @override
  String get statisticsLabelDeaths => '死亡人数';

  @override
  String get statisticsLabelRecoveries => '治愈人数';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get tutorialIntroStepWelcome => '欢迎使用 CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      '及时了解本地新型冠状病毒肺炎 (COVID-19) 的相关统计信息，为抗疫工作提供支持。';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel => '欢迎使用 Covid Near Me 应用';

  @override
  String get tutorialIntroStepLocalStatistics => '了解本地 COVID-19 相关信息。';

  @override
  String get tutorialIntroStepSubmitSymptoms => '匿名提交您的症状信息。';

  @override
  String get tutorialIntroStepAidEffort => '为 COVID-19 抗疫工作尽一份力。';

  @override
  String get tutorialIntroStepGetStarted => '开始使用';

  @override
  String get tutorialLocationStepTitle => '您目前在什么位置？';

  @override
  String get brandingCallout => '与以下合作伙伴联合推出：';

  @override
  String get homeMenuTooltip => '更多';

  @override
  String get homeMenuAbout => '关于 CovidNearMe';

  @override
  String get homeMenuAboutSemantics => '关于 Covid Near Me';

  @override
  String get aboutBoxDescription =>
      '此应用是 Coronavirus Diary 社区开发的一个开源项目。要了解详情并查看源代码，请访问以下链接。';

  @override
  String get aboutBoxLinkText => '在 GitHub 上查看 Coronavirus Diary';

  @override
  String get homeScreenLocalStatisticsTitle => '获取本地 COVID-19 新闻和信息';

  @override
  String get homeScreenLocalStatisticsSubtitle => '查看统计信息并及时了解您所在社区的最新资讯';

  @override
  String get homeScreenLocalStatisticsButton => '开始使用';

  @override
  String get homeScreenReportSymptomsTitle => '记录您的症状信息';

  @override
  String get homeScreenReportSymptomsSubtitle => '快速轻松地进行健康状况检查';

  @override
  String get homeScreenReportSymptomsButton => '开始使用';

  @override
  String get homeScreenShareAppTitle => '分享此应用，为保护您所在的社区尽一份力';

  @override
  String get homeScreenShareAppSubtitle => '与亲朋好友分享此应用，让您所在的社区远离疫病';

  @override
  String get homeScreenShareAppButton => '分享';

  @override
  String get symptomReportLoading => '正在加载';

  @override
  String get symptomReportErrorRetrievingExperience => '出错了，无法加载症状问题。请稍后重试。';

  @override
  String get symptomReportTitle => '记录您的症状信息';

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

    return '第 ${stepIndexString} 步（共 ${stepCountString} 步）';
  }

  @override
  String get symptomReportSubmitButton => '提交';

  @override
  String get symptomReportNextButton => '继续';

  @override
  String get symptomReportAnswerAllQuestions => '请回答所有问题以继续';

  @override
  String get symptomReportIntroStepTitle => '记录您的症状信息';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      '回答与您的健康状况有关的几个简单的问题，即可开始跟踪您的症状。';

  @override
  String get symptomReportIntroStepDataContribution =>
      '您的回答是匿名的，并将用于协助开展 COVID-19 抗疫工作。专家会利用您的匿名信息来预测并改进抗疫措施。';

  @override
  String get symptomReportIntroStepStartButton => '开始使用';

  @override
  String get consentStepQuestion => '''# 知情同意书

由于美国的检测试剂盒短缺，因此我们希望能够了解有多少人有了可能是因感染 COVID-19 而引起的症状。通过此应用收集的信息有助于预测哪些地区的医院将面临最紧张的抗疫压力。这样一来，我们便能够将医生和相关用品分配到最需要的地点。

您是匿名的。我们不想确定您的身份！我们会要求您提供邮政编码，以便统计特定医院周边的病例数量。我们会利用您的症状严重性数据来猜测您感染 COVID-19 的可能性，并确定您所在的区域有多少人已成为重症患者。

我们会将邮政编码对应的每日病例总数提供给各州和地方的医疗卫生机构、美国疾病控制中心 (CDC) 和美国政府，帮助其预测哪些社区需要最大力度的支持。此外，我们还会在此应用内创建病例分布地图，并对相关数据进行地理趋势分析。例如，在学校长期关闭的地区，病例数量可能会比较少；或者，在天气炎热时，疫情的蔓延速度会降低。

您可以在明天或以后的日期返回此应用并输入新的信息。我们能够验证您的身份，因此不会反复将您计入总数。或许您的症状加剧了，或者您获得了 COVID-19 检测结果并想将结果信息告诉我们。无论怎样，您都可以随时在此应用中输入新的信息。

我们不会销售这些数据。这些数据将仅用于公共卫生和研究用途；疫情结束后，这些数据将被删除。

如果您同意以上所有条件，并已年满 18 周岁，请点击“我同意”。否则，请点击“我不同意”。''';

  @override
  String get consentStepDecline => '我不同意';

  @override
  String get consentStepDeclineActive => '我不同意';

  @override
  String get consentStepAgree => '我同意';

  @override
  String get consentStepAgreeActive => '我同意';

  @override
  String get deniedConsentHeading => 'CovidNearMe 在未经您同意的情况下无法收集信息';

  @override
  String get deniedConsentMessage =>
      '如果您改变了主意，可以随时使用此应用。您需要回答与您目前的症状有关的几个问题，并说明您是否已接受 COVID-19 检测。您的信息将以匿名的方式用于协助开展 COVID-19 抗疫工作。';

  @override
  String get deniedConsentSafetyTipsButton => '获取关于如何保持健康的提示';

  @override
  String get symptomReportLocationStepTitle => '您目前在什么位置？';

  @override
  String get questionsStepQuestionsLoadedError => '无法加载问题。';

  @override
  String get systemReportSubmitting => '正在提交您的症状信息';

  @override
  String get systemReportBackToHomePage => '返回首页';

  @override
  String get thankYouScreenTitle => '感谢您分享自己的症状信息，为抗疫工作尽一份力！';

  @override
  String get thankYouScreenFinishButton => '完成';

  @override
  String get thankYouScreenCallToAction =>
      '如果您明天仍然感觉自己有相关症状，请在此应用中再次记录相关的症状信息。';

  @override
  String get thankYouScreenSeriousSymptoms => '如果您的症状加剧了，请与医疗服务提供方联系。';

  @override
  String get thankYouScreenSafetyTipsButton => '安全提示';

  @override
  String get thankYouScreenShareAppButton => '分享此应用';

  @override
  String get questionShortnessOfBreathTitle => '您是否感到气促？';

  @override
  String get questionShortnessOfBreathAnswer0 => '否';

  @override
  String get questionShortnessOfBreathAnswer1 => '轻度';

  @override
  String get questionShortnessOfBreathAnswer2 => '中度';

  @override
  String get questionShortnessOfBreathAnswer3 => '严重';

  @override
  String get questionShortnessOfBreathSemantics0 => '不气促';

  @override
  String get questionShortnessOfBreathSemantics1 => '轻微气促';

  @override
  String get questionShortnessOfBreathSemantics2 => '中度气促';

  @override
  String get questionShortnessOfBreathSemantics3 => '严重气促（呼吸急促）';

  @override
  String get questionHaveACoughTitle => '您是否咳嗽？';

  @override
  String get questionHaveACoughAnswer0 => '否';

  @override
  String get questionHaveACoughAnswer1 => '轻度';

  @override
  String get questionHaveACoughAnswer2 => '中度';

  @override
  String get questionHaveACoughAnswer3 => '无法抑制 - 疼痛难忍！';

  @override
  String get questionHaveACoughSemantics0 => '不咳嗽';

  @override
  String get questionHaveACoughSemantics1 => '轻度咳嗽';

  @override
  String get questionHaveACoughSemantics2 => '中度咳嗽';

  @override
  String get questionHaveACoughSemantics3 => '无法抑制地咳嗽';

  @override
  String get questionHaveNauseaTitle => '您是否觉得恶心，例如，您可能会呕吐或希望自己能吐出来？';

  @override
  String get questionHaveNauseaAnswer0 => '否';

  @override
  String get questionHaveNauseaAnswer1 => '轻度';

  @override
  String get questionHaveNauseaAnswer2 => '中度';

  @override
  String get questionHaveNauseaAnswer3 => '严重';

  @override
  String get questionHaveNauseaSemantics0 => '不恶心';

  @override
  String get questionHaveNauseaSemantics1 => '轻度恶心';

  @override
  String get questionHaveNauseaSemantics2 => '中度恶心';

  @override
  String get questionHaveNauseaSemantics3 => '严重恶心';

  @override
  String get questionHaveAFeverTitle => '您今天是否觉得自己发烧？';

  @override
  String get questionHaveAFeverAnswer0 => '否';

  @override
  String get questionHaveAFeverAnswer1 => '不确定';

  @override
  String get questionHaveAFeverAnswer2 => '严重 - 我体温很高';

  @override
  String get questionHaveAFeverSemantics0 => '不发烧';

  @override
  String get questionHaveAFeverSemantics1 => '可能发烧';

  @override
  String get questionHaveAFeverSemantics2 => '严重发烧，我体温很高';

  @override
  String get questionHowHighWasYourFever => '您今天的体温有多高（如果您测量过）？';

  @override
  String get questionHaveYouBeenFluTestedTitle => '您是否接受过流感、肺炎或其他呼吸道疾病的检测？';

  @override
  String get questionYes => '是';

  @override
  String get questionNo => '否';

  @override
  String get questionFluTestPositiveTitle => '检测结果是阳性吗？';

  @override
  String get questionFluTestPositiveSemantics0 => '是，检测结果是阳性。';

  @override
  String get questionFluTestPositiveSemantics1 => '否，检测结果是阴性。';

  @override
  String get questionWhatWasPositiveTitle => '您感染的是什么疾病？';

  @override
  String get questionTryForTestingTitle => '您是否尝试过接受 COVID-19 检测？';

  @override
  String get questionTryForTestingSemantics0 => '是，我尝试过接受 COVID-19 检测。';

  @override
  String get questionTryForTestingSemantics1 => '否，我没有尝试过接受 COVID-19 检测。';

  @override
  String get questionCovid19TestResultTitle => '检测结果是什么？';

  @override
  String get questionCovid19TestResultAnswer0 => '阴性，我没有感染 COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => '阳性，我感染了 COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => '我还不知道检测结果';

  @override
  String get questionCovid19TestResultAnswer3 => '诊所没有相关检测项目';

  @override
  String get questionCovid19TestResultAnswer4 => '我被拒绝了，因为我的症状还不够严重';

  @override
  String get temperatureFieldHelpButton => '需要帮助吗？点按以获取说明';

  @override
  String get temperatureFieldOutOfRangeError => '请输入有效的体温值。';

  @override
  String get temperatureDialogTitle => '测量体温的时间和方式';

  @override
  String get temperatureDialogWhenHeading => '何时测量？';

  @override
  String get temperatureDialogWait30Minutes => '吃饭、喝水或运动后等待 30 分钟。';

  @override
  String get temperatureDialogWait6Hours =>
      '服用可以降低体温的药物（例如对乙酰氨基酚、布洛芬和阿司匹林）后等待至少 6 个小时。';

  @override
  String get temperatureDialogHowHeading => '如何测量？';

  @override
  String get temperatureDialogStep1 => '用肥皂和水清洗双手。';

  @override
  String get temperatureDialogStep2 => '用肥皂和温水或医用酒精清洗体温计尖端，然后冲洗。';

  @override
  String get temperatureDialogStep3 => '将体温计的尖端放在舌下，然后轻轻闭上嘴唇。';

  @override
  String get temperatureDialogStep4 => '双唇保持闭合状态，并让体温计在舌下保持不动，直到您听到提示音。';

  @override
  String get temperatureDialogStep5 => '取出体温计并记录体温。';

  @override
  String get temperatureDialogCloseButton => '关闭';

  @override
  String get shareAppDownloadPrompt =>
      '下载 CovidNearMe 以获取本地 COVID-19 信息和统计信息。匿名提供您的症状信息，为您的社区尽一份力！{{ APP_LINK }}';

  @override
  String get safetyTipsTitle => '如何保持健康';

  @override
  String get safetyTipsSubtitle => '保护您的健康以及帮助您的社区阻止疾病传播的有效方式。';

  @override
  String get safetyTipsWashYourHands =>
      '经常使用肥皂和水洗手，每次洗手至少持续 20 秒。避免触摸您的眼睛、鼻子和嘴巴，特别是在公共场合。每次咳嗽和打喷嚏时都应使用手肘内侧遮掩口鼻。';

  @override
  String get safetyTipsSocialDistancing =>
      '注意保持社交距离，也就是说限制与他人的接触。出门在外时，请与他人保持至少 6 英尺的距离。';

  @override
  String get safetyTipsContactPhysician => '如果您的症状加剧了，请与医疗服务提供方联系。';

  @override
  String get locationStepTitle => '验证您的地点';

  @override
  String get locationStepInvalidZipCode => '请输入有效的 5 位数邮政编码';

  @override
  String get locationStepZipCode => '邮政编码';

  @override
  String get locationStepNoCountrySelected => '未选择任何国家/地区';

  @override
  String get locationStepCountrySearchPrompt => '请选择您所在的国家/地区';

  @override
  String get locationStepCountryButtonLabel => '国家/地区：';

  @override
  String get networkUnavailableBannerContinueOffline => '在离线状态下继续使用';

  @override
  String get networkUnavailableBannerConnectToWiFi => '连接到 Wi-Fi 网络';

  @override
  String get networkRequestError => '出了点问题，无法完成您的请求。';

  @override
  String get networkUnavailableBannerMessage => '您似乎处于离线状态。请检查您的网络设置，然后重试。';

  @override
  String get scrollMoreIndicatorMessage => '向下滚动可查看更多内容';

  @override
  String get localStatisticsTitle => '本地 COVID-19 统计信息';

  @override
  String get localStatisticsNoLocationSelected => '选择一个地点以查看相应的统计信息。';

  @override
  String get localStatisticsNoDataAvailable => '未找到此地点的 COVID-19 数据。';

  @override
  String get localStatisticsLocationInput => '邮政编码或国家/地区';

  @override
  String get localStatisticsRecentLocationsMenuTitle => '最近查询的地点';

  @override
  String get statisticsLabelCases => '病例数量';

  @override
  String get statisticsLabelDeaths => '死亡人数';

  @override
  String get statisticsLabelRecoveries => '治愈人数';
}
