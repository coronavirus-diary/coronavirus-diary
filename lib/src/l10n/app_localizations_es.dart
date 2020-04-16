// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get tutorialIntroStepWelcome => 'Te damos la bienvenida a CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      'Mantente al día con estadísticas locales del COVID-19 y apoya los esfuerzos de asistencia.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Te damos la bienvenida a la app de Covid Near Me';

  @override
  String get tutorialIntroStepLocalStatistics =>
      'Obtén información local sobre el COVID-19.';

  @override
  String get tutorialIntroStepSubmitSymptoms =>
      'Envía tus síntomas de forma anónima.';

  @override
  String get tutorialIntroStepAidEffort =>
      'Ayuda en los esfuerzos de respuesta frente al COVID-19.';

  @override
  String get tutorialIntroStepGetStarted => 'COMENZAR';

  @override
  String get tutorialLocationStepTitle => '¿Cuál es tu ubicación actual?';

  @override
  String get brandingCallout => 'App creada en asociación con:';

  @override
  String get homeMenuTooltip => 'Más';

  @override
  String get homeMenuAbout => 'Acerca de CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'Acerca de Covid Near Me';

  @override
  String get aboutBoxDescription =>
      'La comunidad de Coronavirus Diary desarrolló esta app como un proyecto de código abierto. Para obtener más información y ver el código fuente, visita el siguiente vínculo.';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary en GitHub';

  @override
  String get homeScreenLocalStatisticsTitle =>
      'Obtén información y noticias locales sobre el COVID-19';

  @override
  String get homeScreenLocalStatisticsSubtitle =>
      'Consulta estadísticas y obtén información actualizada de tu comunidad';

  @override
  String get homeScreenLocalStatisticsButton => 'COMENZAR';

  @override
  String get homeScreenReportSymptomsTitle => 'Registra tus síntomas';

  @override
  String get homeScreenReportSymptomsSubtitle =>
      'Registro de salud rápido y fácil';

  @override
  String get homeScreenReportSymptomsButton => 'COMENZAR';

  @override
  String get homeScreenShareAppTitle =>
      'Comparte la app para proteger tu comunidad';

  @override
  String get homeScreenShareAppSubtitle =>
      'Comparte la app con amigos y familiares para proteger tu comunidad';

  @override
  String get homeScreenShareAppButton => 'COMPARTIR';

  @override
  String get symptomReportLoading => 'Cargando';

  @override
  String get symptomReportErrorRetrievingExperience =>
      'Se produjo un error y no se cargaron las preguntas de los síntomas. Vuelve a intentarlo.';

  @override
  String get symptomReportTitle => 'Registra tus síntomas';

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

    return 'Paso ${stepIndexString} de ${stepCountString}';
  }

  @override
  String get symptomReportSubmitButton => 'ENVIAR';

  @override
  String get symptomReportNextButton => 'CONTINUAR';

  @override
  String get symptomReportAnswerAllQuestions =>
      'Responde todas las preguntas para continuar';

  @override
  String get symptomReportIntroStepTitle => 'Registra tus síntomas';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      'Responde algunas preguntas simples sobre tu salud para empezar a hacer un seguimiento de tus síntomas.';

  @override
  String get symptomReportIntroStepDataContribution =>
      'Tus respuestas son anónimas y se usarán para ayudar en los esfuerzos de respuesta frente al COVID-19. Profesionales expertos usarán tu información anónima para predecir y mejorar las respuestas frente a la enfermedad.';

  @override
  String get symptomReportIntroStepStartButton => 'COMENZAR';

  @override
  String get consentStepQuestion => '''# Consentimiento informado

Como EE.UU. no cuenta con suficientes kits de pruebas, estamos tratando de determinar cuántas personas tienen síntomas que podrían deberse al COVID-19. La información que se recopile con esta app ayudará a predecir cuáles serán los hospitales con mayor demanda. De esa forma, se enviarán más médicos y suministros a los lugares adecuados.

Tu participación es anónima. No nos interesa saber quién eres. Solo necesitaremos saber tu código postal para contar casos en hospitales específicos. Se usará la gravedad de tus síntomas para determinar la probabilidad de que tengas COVID-19 y para ver cuántas personas de tu región se están enfermando gravemente.

Las autoridades de salud estatales y locales, los CDC y el Gobierno de los EE.UU. recibirán el total de casos diarios correspondientes a cada código postal para ayudar a predecir qué comunidades necesitan más asistencia. También haremos un mapa aquí, en esta app, y analizaremos los datos en busca de tendencias geográficas. Por ejemplo, podríamos ver menos casos en áreas en las que se cerraron las escuelas durante mucho tiempo, o quizás veamos que la epidemia se desacelera en climas cálidos.

Puedes volver más adelante e ingresar nueva información otro día. Sabremos que se trata de ti y no te contaremos dos veces. También es posible que te sientas peor o que te hayas hecho la prueba de detección del COVID-19 y quieras compartir el resultado con nosotros.

No venderemos esos datos. Solo los usaremos para fines de salud pública e investigación, y los borraremos cuando finalice la epidemia.

Si estás de acuerdo con todo y eres mayor de 18 años, haz clic en \"Acepto\". De lo contrario, haz clic en \"No acepto\".''';

  @override
  String get consentStepDecline => 'NO ACEPTO';

  @override
  String get consentStepDeclineActive => 'NO ACEPTÉ';

  @override
  String get consentStepAgree => 'ACEPTO';

  @override
  String get consentStepAgreeActive => 'ACEPTÉ';

  @override
  String get deniedConsentHeading =>
      'CovidNearMe no puede recopilar información sin tu consentimiento';

  @override
  String get deniedConsentMessage =>
      'Si cambias de opinión, puedes usar la app en cualquier momento. Te haremos un par de preguntas sobre tus síntomas actuales y si te realizaste la prueba de detección del COVID-19. Se usará tu información de forma anónima para ayudar en los esfuerzos de respuesta frente a la pandemia.';

  @override
  String get deniedConsentSafetyTipsButton =>
      'OBTENER SUGERENCIAS PARA MANTENERSE SALUDABLE';

  @override
  String get symptomReportLocationStepTitle => '¿Cuál es tu ubicación actual?';

  @override
  String get questionsStepQuestionsLoadedError =>
      'No se pudieron cargar las respuestas.';

  @override
  String get systemReportSubmitting => 'Enviando síntomas';

  @override
  String get systemReportBackToHomePage => 'Regresar a la página principal';

  @override
  String get thankYouScreenTitle =>
      'Gracias por compartir tus síntomas para ayudar en los esfuerzos de respuesta ante esta enfermedad';

  @override
  String get thankYouScreenFinishButton => 'FINALIZAR';

  @override
  String get thankYouScreenCallToAction =>
      'Si mañana sigues teniendo síntomas, vuelve a registrarlos en la app.';

  @override
  String get thankYouScreenSeriousSymptoms =>
      'Si empeoran los síntomas, comunícate con tu proveedor de atención médica.';

  @override
  String get thankYouScreenSafetyTipsButton => 'CONSEJOS DE SEGURIDAD';

  @override
  String get thankYouScreenShareAppButton => 'COMPARTIR APP';

  @override
  String get questionShortnessOfBreathTitle =>
      '¿Tienes dificultad para respirar?';

  @override
  String get questionShortnessOfBreathAnswer0 => 'No';

  @override
  String get questionShortnessOfBreathAnswer1 => 'Leve';

  @override
  String get questionShortnessOfBreathAnswer2 => 'Moderada';

  @override
  String get questionShortnessOfBreathAnswer3 => 'Intensa';

  @override
  String get questionShortnessOfBreathSemantics0 =>
      'Sin dificultad para respirar';

  @override
  String get questionShortnessOfBreathSemantics1 =>
      'Dificultad para respirar leve';

  @override
  String get questionShortnessOfBreathSemantics2 =>
      'Dificultad para respirar moderada';

  @override
  String get questionShortnessOfBreathSemantics3 =>
      'Dificultad para respirar intensa';

  @override
  String get questionHaveACoughTitle => '¿Tienes tos?';

  @override
  String get questionHaveACoughAnswer0 => 'No';

  @override
  String get questionHaveACoughAnswer1 => 'Leve';

  @override
  String get questionHaveACoughAnswer2 => 'Moderada';

  @override
  String get questionHaveACoughAnswer3 => 'Incontrolable. ¡Me duele!';

  @override
  String get questionHaveACoughSemantics0 => 'Sin tos';

  @override
  String get questionHaveACoughSemantics1 => 'Tos leve';

  @override
  String get questionHaveACoughSemantics2 => 'Tos moderada';

  @override
  String get questionHaveACoughSemantics3 => 'Tos incontrolable';

  @override
  String get questionHaveNauseaTitle =>
      '¿Sientes náuseas, como si estuvieras por vomitar o quisieras hacerlo?';

  @override
  String get questionHaveNauseaAnswer0 => 'No';

  @override
  String get questionHaveNauseaAnswer1 => 'Leves';

  @override
  String get questionHaveNauseaAnswer2 => 'Moderadas';

  @override
  String get questionHaveNauseaAnswer3 => 'Intensas';

  @override
  String get questionHaveNauseaSemantics0 => 'Sin náuseas';

  @override
  String get questionHaveNauseaSemantics1 => 'Náuseas leves';

  @override
  String get questionHaveNauseaSemantics2 => 'Náuseas moderadas';

  @override
  String get questionHaveNauseaSemantics3 => 'Náuseas intensas';

  @override
  String get questionHaveAFeverTitle => '¿Has tenido fiebre hoy?';

  @override
  String get questionHaveAFeverAnswer0 => 'No';

  @override
  String get questionHaveAFeverAnswer1 => 'Tal vez';

  @override
  String get questionHaveAFeverAnswer2 =>
      'De forma intensa; tengo la temperatura muy alta';

  @override
  String get questionHaveAFeverSemantics0 => 'No tengo fiebre';

  @override
  String get questionHaveAFeverSemantics1 => 'Es posible que tenga fiebre';

  @override
  String get questionHaveAFeverSemantics2 =>
      'Tengo fiebre intensa, tengo la temperatura muy alta';

  @override
  String get questionHowHighWasYourFever =>
      '¿Qué temperatura tuviste hoy (si te la tomaste)?';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      '¿Te hiciste pruebas de detección de gripe, neumonía u otra enfermedad respiratoria?';

  @override
  String get questionYes => 'Sí';

  @override
  String get questionNo => 'No';

  @override
  String get questionFluTestPositiveTitle => '¿El resultado fue positivo?';

  @override
  String get questionFluTestPositiveSemantics0 => 'Sí, fue positivo';

  @override
  String get questionFluTestPositiveSemantics1 => 'No, fue negativo';

  @override
  String get questionWhatWasPositiveTitle => '¿Qué tenías?';

  @override
  String get questionTryForTestingTitle =>
      '¿Intentaste hacerte la prueba de detección del COVID-19?';

  @override
  String get questionTryForTestingSemantics0 => 'Sí, lo intenté';

  @override
  String get questionTryForTestingSemantics1 => 'No, no lo intenté';

  @override
  String get questionCovid19TestResultTitle => '¿Cuál fue el resultado?';

  @override
  String get questionCovid19TestResultAnswer0 => 'Negativo, no tengo COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => 'Positivo, tengo COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => 'Todavía no lo sé';

  @override
  String get questionCovid19TestResultAnswer3 => 'La clínica no tenía pruebas';

  @override
  String get questionCovid19TestResultAnswer4 =>
      'Me rechazaron porque mi enfermedad no parecía lo suficientemente grave';

  @override
  String get temperatureFieldHelpButton =>
      '¿NECESITAS AYUDA? PRESIONA PARA OBTENER INSTRUCCIONES';

  @override
  String get temperatureFieldOutOfRangeError =>
      'Ingresa un valor de temperatura válido.';

  @override
  String get temperatureDialogTitle => 'Cuándo y cómo tomarse la temperatura';

  @override
  String get temperatureDialogWhenHeading => '¿Cuándo?';

  @override
  String get temperatureDialogWait30Minutes =>
      'Espera 30 minutos después de comer, beber o hacer ejercicio.';

  @override
  String get temperatureDialogWait6Hours =>
      'Espera al menos 6 horas después de tomar medicamentos para bajar la temperatura (como acetaminofén, paracetamol, ibuprofeno y aspirina).';

  @override
  String get temperatureDialogHowHeading => '¿Cómo?';

  @override
  String get temperatureDialogStep1 => 'Lávate las manos con agua y jabón.';

  @override
  String get temperatureDialogStep2 =>
      'Lava la punta del termómetro con jabón y agua tibia, o frótala con alcohol. Enjuágala.';

  @override
  String get temperatureDialogStep3 =>
      'Coloca la punta del termómetro debajo de la lengua y cierra suavemente los labios.';

  @override
  String get temperatureDialogStep4 =>
      'Mantén los labios cerrados y el termómetro debajo de la lengua hasta que escuches un pitido.';

  @override
  String get temperatureDialogStep5 =>
      'Retira el termómetro y registra la temperatura.';

  @override
  String get temperatureDialogCloseButton => 'CERRAR';

  @override
  String get shareAppDownloadPrompt =>
      'Descarga CovidNearMe para ver estadísticas e información acerca del COVID-19. Ayuda a tu comunidad con información sobre tus síntomas de forma anónima. {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => 'Cómo mantenerse saludable';

  @override
  String get safetyTipsSubtitle =>
      'Formas efectivas de proteger tu salud y ayudar a la comunidad a detener la expansión de la enfermedad.';

  @override
  String get safetyTipsWashYourHands =>
      'Lávate las manos frecuentemente con agua y jabón durante al menos 20 segundos. No te toques los ojos, la nariz ni la boca, especialmente en público. Si toses o estornudas, cúbrete siempre con la parte interior del codo.';

  @override
  String get safetyTipsSocialDistancing =>
      'Pon en práctica el distanciamiento social, que significa limitar el contacto con otras personas. Mantén al menos 2 metros de distancia con otras personas cuando no estés en tu casa.';

  @override
  String get safetyTipsContactPhysician =>
      'Si empeoran los síntomas, comunícate con tu proveedor de atención médica.';

  @override
  String get locationStepTitle => 'Verifica tu ubicación';

  @override
  String get locationStepInvalidZipCode =>
      'Ingresa un código postal válido de 5 dígitos';

  @override
  String get locationStepZipCode => 'Código postal';

  @override
  String get locationStepNoCountrySelected => 'No se eligió ninguno';

  @override
  String get locationStepCountrySearchPrompt =>
      'Selecciona el país en el que te encuentras';

  @override
  String get locationStepCountryButtonLabel => 'País:';

  @override
  String get networkUnavailableBannerContinueOffline =>
      'CONTINUAR SIN CONEXIÓN';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'CONECTARSE A WI-FI';

  @override
  String get networkRequestError =>
      'Se produjo un error y no se pudo completar tu solicitud.';

  @override
  String get networkUnavailableBannerMessage =>
      'Al parecer, no tienes conexión. Revisa tu configuración de red y vuelve a intentarlo.';

  @override
  String get scrollMoreIndicatorMessage => 'DESPLÁZATE PARA VER MÁS';

  @override
  String get localStatisticsTitle => 'Estadísticas locales del COVID-19';

  @override
  String get localStatisticsNoLocationSelected =>
      'Selecciona una ubicación para ver sus estadísticas.';

  @override
  String get localStatisticsNoDataAvailable =>
      'No se encontraron datos sobre el COVID-19 para esta ubicación.';

  @override
  String get localStatisticsLocationInput => 'Código postal o país';

  @override
  String get localStatisticsRecentLocationsMenuTitle => 'Ubicaciones recientes';

  @override
  String get statisticsLabelCases => 'Casos';

  @override
  String get statisticsLabelDeaths => 'Muertes';

  @override
  String get statisticsLabelRecoveries => 'Personas recuperadas';
}

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get tutorialIntroStepWelcome => 'Te damos la bienvenida a CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      'Mantente al día con estadísticas locales del COVID-19 y apoya los esfuerzos de asistencia.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Te damos la bienvenida a la app de Covid Near Me';

  @override
  String get tutorialIntroStepLocalStatistics =>
      'Obtén información local sobre el COVID-19.';

  @override
  String get tutorialIntroStepSubmitSymptoms =>
      'Envía tus síntomas de forma anónima.';

  @override
  String get tutorialIntroStepAidEffort =>
      'Ayuda en los esfuerzos de respuesta frente al COVID-19.';

  @override
  String get tutorialIntroStepGetStarted => 'COMENZAR';

  @override
  String get tutorialLocationStepTitle => '¿Cuál es tu ubicación actual?';

  @override
  String get brandingCallout => 'App creada en asociación con:';

  @override
  String get homeMenuTooltip => 'Más';

  @override
  String get homeMenuAbout => 'Acerca de CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'Acerca de Covid Near Me';

  @override
  String get aboutBoxDescription =>
      'La comunidad de Coronavirus Diary desarrolló esta app como un proyecto de código abierto. Para obtener más información y ver el código fuente, visita el siguiente vínculo.';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary en GitHub';

  @override
  String get homeScreenLocalStatisticsTitle =>
      'Obtén información y noticias locales sobre el COVID-19';

  @override
  String get homeScreenLocalStatisticsSubtitle =>
      'Consulta estadísticas y obtén información actualizada de tu comunidad';

  @override
  String get homeScreenLocalStatisticsButton => 'COMENZAR';

  @override
  String get homeScreenReportSymptomsTitle => 'Registra tus síntomas';

  @override
  String get homeScreenReportSymptomsSubtitle =>
      'Registro de salud rápido y fácil';

  @override
  String get homeScreenReportSymptomsButton => 'COMENZAR';

  @override
  String get homeScreenShareAppTitle =>
      'Comparte la app para proteger tu comunidad';

  @override
  String get homeScreenShareAppSubtitle =>
      'Comparte la app con amigos y familiares para proteger tu comunidad';

  @override
  String get homeScreenShareAppButton => 'COMPARTIR';

  @override
  String get symptomReportLoading => 'Cargando';

  @override
  String get symptomReportErrorRetrievingExperience =>
      'Se produjo un error y no se cargaron las preguntas de los síntomas. Vuelve a intentarlo.';

  @override
  String get symptomReportTitle => 'Registra tus síntomas';

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

    return 'Paso ${stepIndexString} de ${stepCountString}';
  }

  @override
  String get symptomReportSubmitButton => 'ENVIAR';

  @override
  String get symptomReportNextButton => 'CONTINUAR';

  @override
  String get symptomReportAnswerAllQuestions =>
      'Responde todas las preguntas para continuar';

  @override
  String get symptomReportIntroStepTitle => 'Registra tus síntomas';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      'Responde algunas preguntas simples sobre tu salud para empezar a hacer un seguimiento de tus síntomas.';

  @override
  String get symptomReportIntroStepDataContribution =>
      'Tus respuestas son anónimas y se usarán para ayudar en los esfuerzos de respuesta frente al COVID-19. Profesionales expertos usarán tu información anónima para predecir y mejorar las respuestas frente a la enfermedad.';

  @override
  String get symptomReportIntroStepStartButton => 'COMENZAR';

  @override
  String get consentStepQuestion => '''# Consentimiento informado

Como EE.UU. no cuenta con suficientes kits de pruebas, estamos tratando de determinar cuántas personas tienen síntomas que podrían deberse al COVID-19. La información que se recopile con esta app ayudará a predecir cuáles serán los hospitales con mayor demanda. De esa forma, se enviarán más médicos y suministros a los lugares adecuados.

Tu participación es anónima. No nos interesa saber quién eres. Solo necesitaremos saber tu código postal para contar casos en hospitales específicos. Se usará la gravedad de tus síntomas para determinar la probabilidad de que tengas COVID-19 y para ver cuántas personas de tu región se están enfermando gravemente.

Las autoridades de salud estatales y locales, los CDC y el Gobierno de los EE.UU. recibirán el total de casos diarios correspondientes a cada código postal para ayudar a predecir qué comunidades necesitan más asistencia. También haremos un mapa aquí, en esta app, y analizaremos los datos en busca de tendencias geográficas. Por ejemplo, podríamos ver menos casos en áreas en las que se cerraron las escuelas durante mucho tiempo, o quizás veamos que la epidemia se desacelera en climas cálidos.

Puedes volver más adelante e ingresar nueva información otro día. Sabremos que se trata de ti y no te contaremos dos veces. También es posible que te sientas peor o que te hayas hecho la prueba de detección del COVID-19 y quieras compartir el resultado con nosotros.

No venderemos esos datos. Solo los usaremos para fines de salud pública e investigación, y los borraremos cuando finalice la epidemia.

Si estás de acuerdo con todo y eres mayor de 18 años, haz clic en \"Acepto\". De lo contrario, haz clic en \"No acepto\".''';

  @override
  String get consentStepDecline => 'NO ACEPTO';

  @override
  String get consentStepDeclineActive => 'NO ACEPTÉ';

  @override
  String get consentStepAgree => 'ACEPTO';

  @override
  String get consentStepAgreeActive => 'ACEPTÉ';

  @override
  String get deniedConsentHeading =>
      'CovidNearMe no puede recopilar información sin tu consentimiento';

  @override
  String get deniedConsentMessage =>
      'Si cambias de opinión, puedes usar la app en cualquier momento. Te haremos un par de preguntas sobre tus síntomas actuales y si te realizaste la prueba de detección del COVID-19. Se usará tu información de forma anónima para ayudar en los esfuerzos de respuesta frente a la pandemia.';

  @override
  String get deniedConsentSafetyTipsButton =>
      'OBTENER SUGERENCIAS PARA MANTENERSE SALUDABLE';

  @override
  String get symptomReportLocationStepTitle => '¿Cuál es tu ubicación actual?';

  @override
  String get questionsStepQuestionsLoadedError =>
      'No se pudieron cargar las respuestas.';

  @override
  String get systemReportSubmitting => 'Enviando síntomas';

  @override
  String get systemReportBackToHomePage => 'Regresar a la página principal';

  @override
  String get thankYouScreenTitle =>
      'Gracias por compartir tus síntomas para ayudar en los esfuerzos de respuesta ante esta enfermedad';

  @override
  String get thankYouScreenFinishButton => 'FINALIZAR';

  @override
  String get thankYouScreenCallToAction =>
      'Si mañana sigues teniendo síntomas, vuelve a registrarlos en la app.';

  @override
  String get thankYouScreenSeriousSymptoms =>
      'Si empeoran los síntomas, comunícate con tu proveedor de atención médica.';

  @override
  String get thankYouScreenSafetyTipsButton => 'CONSEJOS DE SEGURIDAD';

  @override
  String get thankYouScreenShareAppButton => 'COMPARTIR APP';

  @override
  String get questionShortnessOfBreathTitle =>
      '¿Tienes dificultad para respirar?';

  @override
  String get questionShortnessOfBreathAnswer0 => 'No';

  @override
  String get questionShortnessOfBreathAnswer1 => 'Leve';

  @override
  String get questionShortnessOfBreathAnswer2 => 'Moderada';

  @override
  String get questionShortnessOfBreathAnswer3 => 'Intensa';

  @override
  String get questionShortnessOfBreathSemantics0 =>
      'Sin dificultad para respirar';

  @override
  String get questionShortnessOfBreathSemantics1 =>
      'Dificultad para respirar leve';

  @override
  String get questionShortnessOfBreathSemantics2 =>
      'Dificultad para respirar moderada';

  @override
  String get questionShortnessOfBreathSemantics3 =>
      'Dificultad para respirar intensa';

  @override
  String get questionHaveACoughTitle => '¿Tienes tos?';

  @override
  String get questionHaveACoughAnswer0 => 'No';

  @override
  String get questionHaveACoughAnswer1 => 'Leve';

  @override
  String get questionHaveACoughAnswer2 => 'Moderada';

  @override
  String get questionHaveACoughAnswer3 => 'Incontrolable. ¡Me duele!';

  @override
  String get questionHaveACoughSemantics0 => 'Sin tos';

  @override
  String get questionHaveACoughSemantics1 => 'Tos leve';

  @override
  String get questionHaveACoughSemantics2 => 'Tos moderada';

  @override
  String get questionHaveACoughSemantics3 => 'Tos incontrolable';

  @override
  String get questionHaveNauseaTitle =>
      '¿Sientes náuseas, como si estuvieras por vomitar o quisieras hacerlo?';

  @override
  String get questionHaveNauseaAnswer0 => 'No';

  @override
  String get questionHaveNauseaAnswer1 => 'Leves';

  @override
  String get questionHaveNauseaAnswer2 => 'Moderadas';

  @override
  String get questionHaveNauseaAnswer3 => 'Intensas';

  @override
  String get questionHaveNauseaSemantics0 => 'Sin náuseas';

  @override
  String get questionHaveNauseaSemantics1 => 'Náuseas leves';

  @override
  String get questionHaveNauseaSemantics2 => 'Náuseas moderadas';

  @override
  String get questionHaveNauseaSemantics3 => 'Náuseas intensas';

  @override
  String get questionHaveAFeverTitle => '¿Has tenido fiebre hoy?';

  @override
  String get questionHaveAFeverAnswer0 => 'No';

  @override
  String get questionHaveAFeverAnswer1 => 'Tal vez';

  @override
  String get questionHaveAFeverAnswer2 =>
      'De forma intensa; tengo la temperatura muy alta';

  @override
  String get questionHaveAFeverSemantics0 => 'No tengo fiebre';

  @override
  String get questionHaveAFeverSemantics1 => 'Es posible que tenga fiebre';

  @override
  String get questionHaveAFeverSemantics2 =>
      'Tengo fiebre intensa, tengo la temperatura muy alta';

  @override
  String get questionHowHighWasYourFever =>
      '¿Qué temperatura tuviste hoy (si te la tomaste)?';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      '¿Te hiciste pruebas de detección de gripe, neumonía u otra enfermedad respiratoria?';

  @override
  String get questionYes => 'Sí';

  @override
  String get questionNo => 'No';

  @override
  String get questionFluTestPositiveTitle => '¿El resultado fue positivo?';

  @override
  String get questionFluTestPositiveSemantics0 => 'Sí, fue positivo';

  @override
  String get questionFluTestPositiveSemantics1 => 'No, fue negativo';

  @override
  String get questionWhatWasPositiveTitle => '¿Qué tenías?';

  @override
  String get questionTryForTestingTitle =>
      '¿Intentaste hacerte la prueba de detección del COVID-19?';

  @override
  String get questionTryForTestingSemantics0 => 'Sí, lo intenté';

  @override
  String get questionTryForTestingSemantics1 => 'No, no lo intenté';

  @override
  String get questionCovid19TestResultTitle => '¿Cuál fue el resultado?';

  @override
  String get questionCovid19TestResultAnswer0 => 'Negativo, no tengo COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 => 'Positivo, tengo COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 => 'Todavía no lo sé';

  @override
  String get questionCovid19TestResultAnswer3 => 'La clínica no tenía pruebas';

  @override
  String get questionCovid19TestResultAnswer4 =>
      'Me rechazaron porque mi enfermedad no parecía lo suficientemente grave';

  @override
  String get temperatureFieldHelpButton =>
      '¿NECESITAS AYUDA? PRESIONA PARA OBTENER INSTRUCCIONES';

  @override
  String get temperatureFieldOutOfRangeError =>
      'Ingresa un valor de temperatura válido.';

  @override
  String get temperatureDialogTitle => 'Cuándo y cómo tomarse la temperatura';

  @override
  String get temperatureDialogWhenHeading => '¿Cuándo?';

  @override
  String get temperatureDialogWait30Minutes =>
      'Espera 30 minutos después de comer, beber o hacer ejercicio.';

  @override
  String get temperatureDialogWait6Hours =>
      'Espera al menos 6 horas después de tomar medicamentos para bajar la temperatura (como acetaminofén, paracetamol, ibuprofeno y aspirina).';

  @override
  String get temperatureDialogHowHeading => '¿Cómo?';

  @override
  String get temperatureDialogStep1 => 'Lávate las manos con agua y jabón.';

  @override
  String get temperatureDialogStep2 =>
      'Lava la punta del termómetro con jabón y agua tibia, o frótala con alcohol. Enjuágala.';

  @override
  String get temperatureDialogStep3 =>
      'Coloca la punta del termómetro debajo de la lengua y cierra suavemente los labios.';

  @override
  String get temperatureDialogStep4 =>
      'Mantén los labios cerrados y el termómetro debajo de la lengua hasta que escuches un pitido.';

  @override
  String get temperatureDialogStep5 =>
      'Retira el termómetro y registra la temperatura.';

  @override
  String get temperatureDialogCloseButton => 'CERRAR';

  @override
  String get shareAppDownloadPrompt =>
      'Descarga CovidNearMe para ver estadísticas e información acerca del COVID-19. Ayuda a tu comunidad con información sobre tus síntomas de forma anónima. {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => 'Cómo mantenerse saludable';

  @override
  String get safetyTipsSubtitle =>
      'Formas efectivas de proteger tu salud y ayudar a la comunidad a detener la expansión de la enfermedad.';

  @override
  String get safetyTipsWashYourHands =>
      'Lávate las manos frecuentemente con agua y jabón durante al menos 20 segundos. No te toques los ojos, la nariz ni la boca, especialmente en público. Si toses o estornudas, cúbrete siempre con la parte interior del codo.';

  @override
  String get safetyTipsSocialDistancing =>
      'Pon en práctica el distanciamiento social, que significa limitar el contacto con otras personas. Mantén al menos 2 metros de distancia con otras personas cuando no estés en tu casa.';

  @override
  String get safetyTipsContactPhysician =>
      'Si empeoran los síntomas, comunícate con tu proveedor de atención médica.';

  @override
  String get locationStepTitle => 'Verifica tu ubicación';

  @override
  String get locationStepInvalidZipCode =>
      'Ingresa un código postal válido de 5 dígitos';

  @override
  String get locationStepZipCode => 'Código postal';

  @override
  String get locationStepNoCountrySelected => 'No se eligió ninguno';

  @override
  String get locationStepCountrySearchPrompt =>
      'Selecciona el país en el que te encuentras';

  @override
  String get locationStepCountryButtonLabel => 'País:';

  @override
  String get networkUnavailableBannerContinueOffline =>
      'CONTINUAR SIN CONEXIÓN';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'CONECTARSE A WI-FI';

  @override
  String get networkRequestError =>
      'Se produjo un error y no se pudo completar tu solicitud.';

  @override
  String get networkUnavailableBannerMessage =>
      'Al parecer, no tienes conexión. Revisa tu configuración de red y vuelve a intentarlo.';

  @override
  String get scrollMoreIndicatorMessage => 'DESPLÁZATE PARA VER MÁS';

  @override
  String get localStatisticsTitle => 'Estadísticas locales del COVID-19';

  @override
  String get localStatisticsNoLocationSelected =>
      'Selecciona una ubicación para ver sus estadísticas.';

  @override
  String get localStatisticsNoDataAvailable =>
      'No se encontraron datos sobre el COVID-19 para esta ubicación.';

  @override
  String get localStatisticsLocationInput => 'Código postal o país';

  @override
  String get localStatisticsRecentLocationsMenuTitle => 'Ubicaciones recientes';

  @override
  String get statisticsLabelCases => 'Casos';

  @override
  String get statisticsLabelDeaths => 'Muertes';

  @override
  String get statisticsLabelRecoveries => 'Personas recuperadas';
}
