// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get tutorialIntroStepWelcome =>
      'Добро пожаловать в приложение CovidNearMe!';

  @override
  String get tutorialIntroStepDescription =>
      'Будьте в курсе местной эпидемиологической обстановки и помогайте бороться с коронавирусной инфекцией COVID-19.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Добро пожаловать в приложение Covid Near Me!';

  @override
  String get tutorialIntroStepLocalStatistics =>
      'Получайте местную информацию о COVID-19.';

  @override
  String get tutorialIntroStepSubmitSymptoms =>
      'Анонимно отправляйте сведения о своих симптомах.';

  @override
  String get tutorialIntroStepAidEffort =>
      'Помогайте защищать людей от COVID-19.';

  @override
  String get tutorialIntroStepGetStarted => 'НАЧАТЬ';

  @override
  String get tutorialLocationStepTitle => 'Где вы находитесь?';

  @override
  String get brandingCallout => 'Создано при участии';

  @override
  String get homeMenuTooltip => 'Ещё';

  @override
  String get homeMenuAbout => 'О приложении CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'О приложении Covid Near Me';

  @override
  String get aboutBoxDescription =>
      'Приложение создано сообществом Coronavirus Diary как проект с открытым исходным кодом. Чтобы узнать больше и посмотреть код, перейдите по ссылке ниже.';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary в хранилище GitHub';

  @override
  String get homeScreenLocalStatisticsTitle =>
      'Местные новости и сведения о COVID-19';

  @override
  String get homeScreenLocalStatisticsSubtitle =>
      'Посмотрите статистику и актуальную информацию для своего региона.';

  @override
  String get homeScreenLocalStatisticsButton => 'НАЧАТЬ';

  @override
  String get homeScreenReportSymptomsTitle => 'Записывайте свои симптомы';

  @override
  String get homeScreenReportSymptomsSubtitle =>
      'Регистрируйте состояние здоровья быстро и без лишних усилий.';

  @override
  String get homeScreenReportSymptomsButton => 'НАЧАТЬ';

  @override
  String get homeScreenShareAppTitle =>
      'Помогайте защищать людей в своем регионе';

  @override
  String get homeScreenShareAppSubtitle =>
      'Делитесь приложением с друзьями и близкими и не давайте заболеванию распространяться.';

  @override
  String get homeScreenShareAppButton => 'ПОДЕЛИТЬСЯ';

  @override
  String get symptomReportLoading => 'Загрузка…';

  @override
  String get symptomReportErrorRetrievingExperience =>
      'Произошла ошибка. Не удалось загрузить вопросы о симптомах. Повторите попытку позже.';

  @override
  String get symptomReportTitle => 'Запись симптомов';

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

    return 'Шаг ${stepIndexString} из ${stepCountString}';
  }

  @override
  String get symptomReportSubmitButton => 'ОТПРАВИТЬ';

  @override
  String get symptomReportNextButton => 'ПРОДОЛЖИТЬ';

  @override
  String get symptomReportAnswerAllQuestions =>
      'Чтобы продолжить, ответьте на все вопросы.';

  @override
  String get symptomReportIntroStepTitle => 'Запишите свои симптомы';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      'Чтобы начать отслеживать симптомы, ответьте на несколько простых вопросов.';

  @override
  String get symptomReportIntroStepDataContribution =>
      'Ваши ответы анонимны. Они будут использоваться в борьбе с коронавирусной инфекцией COVID-19. Благодаря этим анонимным данным эксперты смогут прогнозировать развитие ситуации и совершенствовать меры противодействия заболеванию.';

  @override
  String get symptomReportIntroStepStartButton => 'НАЧАТЬ';

  @override
  String get consentStepQuestion => '''# Информированное добровольное согласие

В США не хватает тестов для диагностики, поэтому мы хотим выяснить, у скольких человек есть симптомы, которые могут быть вызваны коронавирусной инфекцией COVID-19. Информация, собранная с помощью этого приложения, позволит прогнозировать, в какие больницы поступит наибольшее число заболевших. Надеемся, что это поможет направить врачей и ресурсы туда, где они больше всего нужны.

Вы пользуетесь приложением анонимно. Нам не нужно знать, кто Вы! Чтобы определять количество случаев заболевания на территориях, закрепленных за определенными больницами, мы собираем данные о почтовых индексах. Вероятность того, что у Вас коронавирусная инфекция COVID-19, будет определяться по тяжести симптомов. По этому же показателю будет отслеживаться количество тяжело заболевших людей в Вашем регионе.

Чтобы определить, где потребуется наибольшая поддержка, общее число ежедневных случаев заболевания по каждому почтовому индексу будет передаваться государственным и местным органам здравоохранения, Центрам по контролю и профилактике заболеваний США (CDC), а также правительству США. Мы также добавим в приложение карту. С помощью анализа данных будут определяться тенденции распространения заболевания. Не исключено, что меньше случаев заболевания будет зафиксировано в тех районах, где в течение длительного времени закрыты школы или, например, стоит жаркая погода.

Вы можете зайти в приложение на другой день и ввести новые данные. Мы поймем, что это Вы, и посчитаем Ваш случай только один раз. Возможно, Вы захотите сообщить о том, что Вам стало хуже или Вы получили результаты теста на COVID-19.

Мы не будем продавать эти данные. Они будут использоваться только для исследований и анализа распространения заболевания. После окончания пандемии эта информация будет удалена.

Если Вы согласны со всем перечисленным выше и Вам уже исполнилось 18 лет, нажмите \"Принять\". В противном случае выберите \"Не принимать\".''';

  @override
  String get consentStepDecline => 'НЕ ПРИНИМАТЬ';

  @override
  String get consentStepDeclineActive => 'НЕ ПРИНЯТО';

  @override
  String get consentStepAgree => 'ПРИНЯТЬ';

  @override
  String get consentStepAgreeActive => 'ПРИНЯТО';

  @override
  String get deniedConsentHeading =>
      'CovidNearMe не может собирать информацию без вашего согласия';

  @override
  String get deniedConsentMessage =>
      'Если вы передумаете, то сможете начать пользоваться приложением в любое время. Мы попросим вас ответить на несколько вопросов о текущих симптомах и указать, сдавали ли вы тест на COVID-19. Эта информация анонимна. Она будет использоваться в борьбе с распространением заболевания.';

  @override
  String get deniedConsentSafetyTipsButton => 'СОВЕТЫ ПО ЗАЩИТЕ ЗДОРОВЬЯ';

  @override
  String get symptomReportLocationStepTitle => 'Где вы находитесь?';

  @override
  String get questionsStepQuestionsLoadedError =>
      'Не удалось загрузить вопросы.';

  @override
  String get systemReportSubmitting => 'Отправка информации о симптомах…';

  @override
  String get systemReportBackToHomePage => 'Вернуться на главный экран';

  @override
  String get thankYouScreenTitle =>
      'Спасибо, что поделились информацией о своих симптомах и помогли в борьбе с распространением заболевания!';

  @override
  String get thankYouScreenFinishButton => 'ГОТОВО';

  @override
  String get thankYouScreenCallToAction =>
      'Если завтра симптомы не исчезнут, ещё раз ответьте на вопросы в приложении.';

  @override
  String get thankYouScreenSeriousSymptoms =>
      'Если почувствуете себя хуже, свяжитесь с медицинской организацией.';

  @override
  String get thankYouScreenSafetyTipsButton => 'СОВЕТЫ ПО БЕЗОПАСНОСТИ';

  @override
  String get thankYouScreenShareAppButton => 'РАССКАЗАТЬ О ПРИЛОЖЕНИИ';

  @override
  String get questionShortnessOfBreathTitle => 'У Вас есть одышка?';

  @override
  String get questionShortnessOfBreathAnswer0 => 'Нет';

  @override
  String get questionShortnessOfBreathAnswer1 => 'Легкая';

  @override
  String get questionShortnessOfBreathAnswer2 => 'Средняя';

  @override
  String get questionShortnessOfBreathAnswer3 => 'Тяжелая';

  @override
  String get questionShortnessOfBreathSemantics0 => 'Одышки нет';

  @override
  String get questionShortnessOfBreathSemantics1 => 'Легкая одышка';

  @override
  String get questionShortnessOfBreathSemantics2 => 'Средняя одышка';

  @override
  String get questionShortnessOfBreathSemantics3 => 'Тяжелая одышка';

  @override
  String get questionHaveACoughTitle => 'У Вас есть кашель?';

  @override
  String get questionHaveACoughAnswer0 => 'Нет';

  @override
  String get questionHaveACoughAnswer1 => 'Легкий';

  @override
  String get questionHaveACoughAnswer2 => 'Средний';

  @override
  String get questionHaveACoughAnswer3 => 'Неудержимый (больно кашлять)';

  @override
  String get questionHaveACoughSemantics0 => 'Кашля нет';

  @override
  String get questionHaveACoughSemantics1 => 'Легкий кашель';

  @override
  String get questionHaveACoughSemantics2 => 'Средний кашель';

  @override
  String get questionHaveACoughSemantics3 => 'Неудержимый кашель';

  @override
  String get questionHaveNauseaTitle =>
      'Вы чувствуете тошноту, словно Вас может вырвать?';

  @override
  String get questionHaveNauseaAnswer0 => 'Нет';

  @override
  String get questionHaveNauseaAnswer1 => 'Легкая';

  @override
  String get questionHaveNauseaAnswer2 => 'Средняя';

  @override
  String get questionHaveNauseaAnswer3 => 'Тяжелая';

  @override
  String get questionHaveNauseaSemantics0 => 'Тошноты нет';

  @override
  String get questionHaveNauseaSemantics1 => 'Тошнота в легкой форме';

  @override
  String get questionHaveNauseaSemantics2 => 'Тошнота в средней форме';

  @override
  String get questionHaveNauseaSemantics3 => 'Тошнота в тяжелой форме';

  @override
  String get questionHaveAFeverTitle =>
      'Как Вы думаете, у Вас был сегодня жар?';

  @override
  String get questionHaveAFeverAnswer0 => 'Нет';

  @override
  String get questionHaveAFeverAnswer1 => 'Может быть';

  @override
  String get questionHaveAFeverAnswer2 => 'Сильный жар (я словно горю)';

  @override
  String get questionHaveAFeverSemantics0 => 'Жара нет';

  @override
  String get questionHaveAFeverSemantics1 => 'Возможно, у меня жар';

  @override
  String get questionHaveAFeverSemantics2 =>
      'У меня сильный жар (я словно горю)';

  @override
  String get questionHowHighWasYourFever =>
      'Если Вы измеряли температуру тела, до какого значения она поднялась?';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      'Вы проходили проверку на грипп, пневмонию или другое респираторное заболевание?';

  @override
  String get questionYes => 'Да';

  @override
  String get questionNo => 'Нет';

  @override
  String get questionFluTestPositiveTitle =>
      'Заболевание было подтверждено тестом?';

  @override
  String get questionFluTestPositiveSemantics0 => 'Да, тест положительный.';

  @override
  String get questionFluTestPositiveSemantics1 => 'Нет, тест отрицательный.';

  @override
  String get questionWhatWasPositiveTitle => 'Что у Вас диагностировали?';

  @override
  String get questionTryForTestingTitle =>
      'Вы пробовали сдать тест на COVID-19?';

  @override
  String get questionTryForTestingSemantics0 =>
      'Да, была попытка сдать тест на COVID-19.';

  @override
  String get questionTryForTestingSemantics1 =>
      'Нет, не было попытки сдать тест на COVID-19.';

  @override
  String get questionCovid19TestResultTitle => 'С каким результатом?';

  @override
  String get questionCovid19TestResultAnswer0 => 'У меня нет COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => 'У меня есть COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => 'Я пока не знаю';

  @override
  String get questionCovid19TestResultAnswer3 => 'В клинике не было тестов';

  @override
  String get questionCovid19TestResultAnswer4 =>
      'Мне отказали, поскольку симптомы слабо выражены';

  @override
  String get temperatureFieldHelpButton => 'НУЖНА ПОМОЩЬ? НАЖМИТЕ';

  @override
  String get temperatureFieldOutOfRangeError =>
      'Введите действительное значение температуры тела.';

  @override
  String get temperatureDialogTitle =>
      'Как правильно измерять температуру тела';

  @override
  String get temperatureDialogWhenHeading => 'Когда?';

  @override
  String get temperatureDialogWait30Minutes =>
      'Подождите 30 минут после еды, питья или выполнения упражнений.';

  @override
  String get temperatureDialogWait6Hours =>
      'Подождите как минимум 6 часов после приема медикаментов, понижающих температуру тела, например ацетаминофена, парацетамола, ибупрофена или аспирина.';

  @override
  String get temperatureDialogHowHeading => 'Как?';

  @override
  String get temperatureDialogStep1 => 'Вымойте руки водой с мылом.';

  @override
  String get temperatureDialogStep2 =>
      'Вымойте кончик термометра теплой водой с мылом или протрите его медицинским спиртом. Ополосните.';

  @override
  String get temperatureDialogStep3 =>
      'Положите кончик термометра под язык и осторожно закройте рот.';

  @override
  String get temperatureDialogStep4 =>
      'Держите градусник под языком и не открывайте рот, пока не услышите сигнал.';

  @override
  String get temperatureDialogStep5 =>
      'Достаньте термометр и запишите результат измерения.';

  @override
  String get temperatureDialogCloseButton => 'ЗАКРЫТЬ';

  @override
  String get shareAppDownloadPrompt =>
      'Скачайте приложение CovidNearMe, чтобы получать местную информацию и статистику, связанную с COVID-19. Помогите защитить тех, кто живет в вашем регионе, предоставив анонимные данные о своих симптомах. {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => 'Что делать, чтобы не заболеть';

  @override
  String get safetyTipsSubtitle =>
      'Далее перечислены эффективные способы защитить себя и помочь в предотвращении распространения заболевания среди жителей вашего региона.';

  @override
  String get safetyTipsWashYourHands =>
      'Часто мойте руки водой с мылом (не меньше 20 секунд). Постарайтесь не трогать глаза, нос и рот, особенно в общественных местах. Всегда прикрывайте рот сгибом локтя, когда чихаете или кашляете.';

  @override
  String get safetyTipsSocialDistancing =>
      'Соблюдайте правила социального дистанцирования, ограничив контакты с другими людьми. Если вы вышли из дома, следите, чтобы расстояние между вами и другими людьми составляло как минимум два метра.';

  @override
  String get safetyTipsContactPhysician =>
      'Если почувствуете себя хуже, свяжитесь с медицинской организацией.';

  @override
  String get locationStepTitle => 'Подтвердите свое местоположение';

  @override
  String get locationStepInvalidZipCode =>
      'Введите действительный пятизначный почтовый индекс.';

  @override
  String get locationStepZipCode => 'Почтовый индекс';

  @override
  String get locationStepNoCountrySelected => 'Ничего не выбрано';

  @override
  String get locationStepCountrySearchPrompt =>
      'Выберите страну, где вы находитесь';

  @override
  String get locationStepCountryButtonLabel => 'Страна:';

  @override
  String get networkUnavailableBannerContinueOffline => 'ПРОДОЛЖИТЬ ОФЛАЙН';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'ПОДКЛЮЧИТЬСЯ К WI-FI';

  @override
  String get networkRequestError =>
      'Произошла ошибка. Не удалось выполнить ваш запрос.';

  @override
  String get networkUnavailableBannerMessage =>
      'У вас нет подключения к Интернету. Проверьте сетевые настройки и повторите попытку.';

  @override
  String get scrollMoreIndicatorMessage => 'ПРОКРУТИТЬ ДАЛЬШЕ';

  @override
  String get localStatisticsTitle =>
      'Местная статистика распространения COVID-19';

  @override
  String get localStatisticsNoLocationSelected =>
      'Чтобы увидеть статистику, выберите местоположение.';

  @override
  String get localStatisticsNoDataAvailable =>
      'Для этого местоположения не найдены данные, связанные с COVID-19.';

  @override
  String get localStatisticsLocationInput => 'Почтовый индекс или страна';

  @override
  String get localStatisticsRecentLocationsMenuTitle =>
      'Недавние местоположения';

  @override
  String get statisticsLabelCases => 'Заболело';

  @override
  String get statisticsLabelDeaths => 'Умерло';

  @override
  String get statisticsLabelRecoveries => 'Выздоровело';
}
