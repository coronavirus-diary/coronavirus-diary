// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get tutorialIntroStepWelcome => 'Chào mừng bạn đến với CovidNearMe';

  @override
  String get tutorialIntroStepDescription =>
      'Cập nhật số liệu thống kê về COVID-19 ở địa phương và giúp ứng phó dịch bệnh.';

  @override
  String get tutorialIntroStepWelcomeSemanticsLabel =>
      'Chào mừng bạn đến với ứng dụng Covid Near Me';

  @override
  String get tutorialIntroStepLocalStatistics =>
      'Nhận thông tin về tình hình dịch bệnh COVID-19 tại địa phương.';

  @override
  String get tutorialIntroStepSubmitSymptoms =>
      'Gửi thông tin về các triệu chứng của bạn theo cách ẩn danh.';

  @override
  String get tutorialIntroStepAidEffort =>
      'Chung sức ứng phó dịch bệnh COVID-19.';

  @override
  String get tutorialIntroStepGetStarted => 'BẮT ĐẦU';

  @override
  String get tutorialLocationStepTitle => 'Bạn đang sinh sống ở đâu?';

  @override
  String get brandingCallout => 'Đối tác cùng phát triển ứng dụng:';

  @override
  String get homeMenuTooltip => 'Thêm';

  @override
  String get homeMenuAbout => 'Giới thiệu về CovidNearMe';

  @override
  String get homeMenuAboutSemantics => 'Giới thiệu về Covid Near Me';

  @override
  String get aboutBoxDescription =>
      'Ứng dụng này do cộng đồng Coronavirus Diary phát triển theo hình thức dự án nguồn mở. Để tìm hiểu thêm và xem mã nguồn, vui lòng truy cập vào đường liên kết ở bên dưới.';

  @override
  String get aboutBoxLinkText => 'Coronavirus Diary trên GitHub';

  @override
  String get homeScreenLocalStatisticsTitle =>
      'Nhận thông tin và tin tức về tình hình dịch bệnh COVID-19 tại địa phương';

  @override
  String get homeScreenLocalStatisticsSubtitle =>
      'Xem số liệu thống kê và nhận thông tin mới nhất về tình hình dịch bệnh tại cộng đồng của bạn';

  @override
  String get homeScreenLocalStatisticsButton => 'BẮT ĐẦU';

  @override
  String get homeScreenReportSymptomsTitle => 'Ghi lại các triệu chứng của bạn';

  @override
  String get homeScreenReportSymptomsSubtitle =>
      'Kiểm tra tình trạng sức khỏe nhanh chóng và dễ dàng';

  @override
  String get homeScreenReportSymptomsButton => 'BẮT ĐẦU';

  @override
  String get homeScreenShareAppTitle =>
      'Chung tay bảo vệ cộng đồng bằng cách chia sẻ ứng dụng';

  @override
  String get homeScreenShareAppSubtitle =>
      'Chia sẻ ứng dụng với gia đình và bạn bè để bảo vệ sức khỏe của cả cộng đồng';

  @override
  String get homeScreenShareAppButton => 'CHIA SẺ';

  @override
  String get symptomReportLoading => 'Đang tải';

  @override
  String get symptomReportErrorRetrievingExperience =>
      'Đã xảy ra lỗi nên không tải được các câu hỏi về triệu chứng. Vui lòng thử lại sau.';

  @override
  String get symptomReportTitle => 'Ghi lại các triệu chứng của bạn';

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

    return 'Bước ${stepIndexString}/${stepCountString}';
  }

  @override
  String get symptomReportSubmitButton => 'GỬI';

  @override
  String get symptomReportNextButton => 'TIẾP TỤC';

  @override
  String get symptomReportAnswerAllQuestions =>
      'Vui lòng trả lời tất cả các câu hỏi để tiếp tục';

  @override
  String get symptomReportIntroStepTitle => 'Ghi lại các triệu chứng của bạn';

  @override
  String get symptomReportIntroStepHealthQuestions =>
      'Hãy trả lời một số câu hỏi đơn giản về sức khỏe của bạn để bắt đầu theo dõi các triệu chứng.';

  @override
  String get symptomReportIntroStepDataContribution =>
      'Chúng tôi sẽ thu thập các câu trả lời của bạn theo cách ẩn danh và sử dụng cho mục đích hỗ trợ ứng phó dịch bệnh COVID-19. Các chuyên gia sẽ sử dụng thông tin bạn gửi ở dạng ẩn danh để dự đoán và tăng cường biện pháp ứng phó với dịch bệnh.';

  @override
  String get symptomReportIntroStepStartButton => 'BẮT ĐẦU';

  @override
  String get consentStepQuestion =>
      '''# Phiếu đồng ý trên cơ sở có đầy đủ thông tin

Vì Hoa Kỳ không có đủ bộ xét nghiệm, nên chúng tôi đang tìm cách xác định số người có triệu chứng có thể liên quan đến COVID-19. Dựa vào thông tin mà ứng dụng này thu thập, chúng tôi có thể dự đoán được những nơi sẽ xảy ra tình trạng quá tải ở các bệnh viện. Để từ đó, có sự chuẩn bị tốt về đội ngũ y bác sĩ và trang thiết bị y tế.

Hiện bạn đang ở chế độ ẩn danh. Chúng tôi không cần biết về danh tính của bạn! Chúng tôi chỉ cần bạn cung cấp mã bưu chính để tính số ca ở gần những bệnh viện cụ thể. Dựa vào mức độ nghiêm trọng của triệu chứng mà bạn gặp phải, chúng tôi sẽ dự đoán khả năng nhiễm COVID-19 của bạn và xác định số người có thể gặp vấn đề sức khỏe nghiêm trọng ở khu vực của bạn.

Chúng tôi sẽ cung cấp thông tin về tổng số ca hằng ngày cùng mã bưu chính cho các cơ quan y tế của tiểu bang và địa phương, Trung tâm kiểm soát và phòng ngừa dịch bệnh (CDC) cũng như chính phủ Hoa Kỳ, nhằm giúp dự đoán những cộng đồng cần được hỗ trợ nhất. Chúng tôi cũng tạo bản đồ ngay trên ứng dụng này. Ngoài ra, dữ liệu sẽ được phân tích để xác định các xu hướng theo vị trí địa lý. Chẳng hạn, chúng ta có thể thấy rằng ở những khu vực đã đóng cửa trường học trong một thời gian dài, số ca sẽ ít hơn hoặc dịch bệnh sẽ diễn biến chậm hơn trong điều kiện thời tiết nóng.

Bạn có thể quay lại vào lúc khác và nhập thông tin mới vào một ngày khác. Chúng tôi biết đó là bạn và sẽ không tính bạn thêm lần nữa. Có thể bạn thấy các triệu chứng bệnh nặng hơn hoặc đã nhận được kết quả xét nghiệm COVID-19 và muốn chia sẻ với chúng tôi.

Chúng tôi sẽ không bán dữ liệu này. Chúng tôi sẽ chỉ sử dụng dữ liệu này cho mục đích nghiên cứu và bảo vệ sức khỏe cộng đồng. Dữ liệu này sẽ bị xóa sau khi dịch bệnh chấm dứt.

Nếu bạn đồng ý với tất cả những điều trên và bạn đã đủ 18 tuổi, vui lòng nhấp vào \"Tôi đồng ý\". Nếu không, hãy nhấp vào \"Tôi không đồng ý\".''';

  @override
  String get consentStepDecline => 'TÔI KHÔNG ĐỒNG Ý';

  @override
  String get consentStepDeclineActive => 'TÔI KHÔNG ĐỒNG Ý';

  @override
  String get consentStepAgree => 'TÔI ĐỒNG Ý';

  @override
  String get consentStepAgreeActive => 'TÔI ĐÃ ĐỒNG Ý';

  @override
  String get deniedConsentHeading =>
      'CovidNearMe không thể thu thập thông tin nếu bạn không đồng ý.';

  @override
  String get deniedConsentMessage =>
      'Nếu thay đổi ý định, bạn vẫn có thể dùng ứng dụng này bất cứ lúc nào. Chúng tôi sẽ hỏi bạn một vài câu hỏi liên quan đến các triệu chứng bạn đang gặp phải và liệu bạn đã được xét nghiệm COVID-19 hay chưa. Chúng tôi sẽ sử dụng thông tin của bạn theo cách ẩn danh để hỗ trợ ứng phó dịch bệnh COVID-19.';

  @override
  String get deniedConsentSafetyTipsButton => 'XEM CÁC MẸO GIỮ GÌN SỨC KHỎE';

  @override
  String get symptomReportLocationStepTitle => 'Bạn đang sinh sống ở đâu?';

  @override
  String get questionsStepQuestionsLoadedError => 'Không tải được câu hỏi.';

  @override
  String get systemReportSubmitting =>
      'Đang gửi thông tin về các triệu chứng của bạn';

  @override
  String get systemReportBackToHomePage => 'Quay lại trang chủ';

  @override
  String get thankYouScreenTitle =>
      'Cảm ơn bạn đã chia sẻ thông tin về các triệu chứng để giúp ứng phó dịch bệnh!';

  @override
  String get thankYouScreenFinishButton => 'HOÀN TẤT';

  @override
  String get thankYouScreenCallToAction =>
      'Nếu ngày mai bạn vẫn tiếp tục thấy các triệu chứng này, hãy truy cập vào ứng dụng và ghi lại các triệu chứng đó.';

  @override
  String get thankYouScreenSeriousSymptoms =>
      'Nếu các triệu chứng có dấu hiệu nặng hơn, hãy liên hệ với nhà cung cấp dịch vụ y tế của bạn.';

  @override
  String get thankYouScreenSafetyTipsButton => 'MẸO AN TOÀN';

  @override
  String get thankYouScreenShareAppButton => 'CHIA SẺ ỨNG DỤNG';

  @override
  String get questionShortnessOfBreathTitle => 'Bạn có đang bị khó thở không?';

  @override
  String get questionShortnessOfBreathAnswer0 => 'Không';

  @override
  String get questionShortnessOfBreathAnswer1 => 'Nhẹ';

  @override
  String get questionShortnessOfBreathAnswer2 => 'Vừa phải';

  @override
  String get questionShortnessOfBreathAnswer3 => 'Nghiêm trọng';

  @override
  String get questionShortnessOfBreathSemantics0 => 'Không khó thở';

  @override
  String get questionShortnessOfBreathSemantics1 => 'Khó thở nhẹ';

  @override
  String get questionShortnessOfBreathSemantics2 => 'Khó thở vừa phải';

  @override
  String get questionShortnessOfBreathSemantics3 => 'Khó thở nghiêm trọng';

  @override
  String get questionHaveACoughTitle => 'Bạn có ho không?';

  @override
  String get questionHaveACoughAnswer0 => 'Không';

  @override
  String get questionHaveACoughAnswer1 => 'Nhẹ';

  @override
  String get questionHaveACoughAnswer2 => 'Vừa phải';

  @override
  String get questionHaveACoughAnswer3 => 'Ho không ngừng – Đau họng!';

  @override
  String get questionHaveACoughSemantics0 => 'Không ho';

  @override
  String get questionHaveACoughSemantics1 => 'Ho nhẹ';

  @override
  String get questionHaveACoughSemantics2 => 'Ho vừa phải';

  @override
  String get questionHaveACoughSemantics3 => 'Ho không ngừng';

  @override
  String get questionHaveNauseaTitle =>
      'Bạn có cảm thấy buồn nôn, chẳng hạn như có thể nôn ra hoặc muốn nôn hay không?';

  @override
  String get questionHaveNauseaAnswer0 => 'Không';

  @override
  String get questionHaveNauseaAnswer1 => 'Nhẹ';

  @override
  String get questionHaveNauseaAnswer2 => 'Vừa phải';

  @override
  String get questionHaveNauseaAnswer3 => 'Nhiều';

  @override
  String get questionHaveNauseaSemantics0 => 'Không buồn nôn';

  @override
  String get questionHaveNauseaSemantics1 => 'Buồn nôn nhẹ';

  @override
  String get questionHaveNauseaSemantics2 => 'Buồn nôn vừa phải';

  @override
  String get questionHaveNauseaSemantics3 => 'Buồn nôn nhiều';

  @override
  String get questionHaveAFeverTitle => 'Bạn có thấy bị sốt hôm nay không?';

  @override
  String get questionHaveAFeverAnswer0 => 'Không';

  @override
  String get questionHaveAFeverAnswer1 => 'Có thể';

  @override
  String get questionHaveAFeverAnswer2 => 'Sốt cao – Người rất nóng';

  @override
  String get questionHaveAFeverSemantics0 => 'Không sốt';

  @override
  String get questionHaveAFeverSemantics1 => 'Có thể bị sốt';

  @override
  String get questionHaveAFeverSemantics2 => 'Sốt cao, người rất nóng';

  @override
  String get questionHowHighWasYourFever =>
      'Nhiệt độ cơ thể bạn hôm nay là bao nhiêu? (nếu có đo nhiệt độ)';

  @override
  String get questionHaveYouBeenFluTestedTitle =>
      'Bạn đã xét nghiệm cúm, viêm phổi hoặc các bệnh về đường hô hấp khác chưa?';

  @override
  String get questionYes => 'Rồi';

  @override
  String get questionNo => 'Chưa';

  @override
  String get questionFluTestPositiveTitle =>
      'Kết quả xét nghiệm có phải là dương tính không?';

  @override
  String get questionFluTestPositiveSemantics0 =>
      'Đúng, kết quả xét nghiệm là dương tính.';

  @override
  String get questionFluTestPositiveSemantics1 =>
      'Không, kết quả xét nghiệm là âm tính.';

  @override
  String get questionWhatWasPositiveTitle => 'Bạn đã mắc bệnh gì?';

  @override
  String get questionTryForTestingTitle => 'Bạn đã xét nghiệm COVID-19 chưa?';

  @override
  String get questionTryForTestingSemantics0 =>
      'Rồi, tôi đã xét nghiệm COVID-19.';

  @override
  String get questionTryForTestingSemantics1 =>
      'Chưa, tôi chưa xét nghiệm COVID-19.';

  @override
  String get questionCovid19TestResultTitle => 'Kết quả là gì?';

  @override
  String get questionCovid19TestResultAnswer0 =>
      'Âm tính, tôi không bị nhiễm COVID-19';

  @override
  String get questionCovid19TestResultAnswer1 =>
      'Dương tính, tôi bị nhiễm COVID-19';

  @override
  String get questionCovid19TestResultAnswer2 =>
      'Tôi vẫn chưa nhận được kết quả';

  @override
  String get questionCovid19TestResultAnswer3 =>
      'Cơ sở y tế không có dụng cụ xét nghiệm';

  @override
  String get questionCovid19TestResultAnswer4 =>
      'Tôi không được xét nghiệm vì chỉ ốm nhẹ';

  @override
  String get temperatureFieldHelpButton =>
      'BẠN CẦN ĐƯỢC TRỢ GIÚP? NHẤN ĐỂ XEM HƯỚNG DẪN';

  @override
  String get temperatureFieldOutOfRangeError =>
      'Vui lòng nhập giá trị nhiệt độ hợp lệ.';

  @override
  String get temperatureDialogTitle => 'Thời điểm và cách đo thân nhiệt';

  @override
  String get temperatureDialogWhenHeading => 'Thời điểm';

  @override
  String get temperatureDialogWait30Minutes =>
      'Chờ 30 phút sau khi ăn uống hoặc tập luyện.';

  @override
  String get temperatureDialogWait6Hours =>
      'Chờ ít nhất 6 tiếng sau khi uống thuốc hạ sốt (chẳng hạn như Acetaminophen, Paracetamol, Ibuprofen và Aspirin).';

  @override
  String get temperatureDialogHowHeading => 'Cách đo';

  @override
  String get temperatureDialogStep1 => 'Rửa tay bằng xà phòng và nước.';

  @override
  String get temperatureDialogStep2 =>
      'Rửa đầu nhiệt kế bằng xà phòng và nước ấm hoặc cồn tẩy rửa. Sau đó tráng lại.';

  @override
  String get temperatureDialogStep3 =>
      'Đặt đầu nhiệt kế dưới lưỡi rồi nhẹ nhàng ngậm miệng lại.';

  @override
  String get temperatureDialogStep4 =>
      'Ngậm miệng và giữ nhiệt kế ở dưới lưỡi đến khi bạn nghe thấy có tiếng bíp.';

  @override
  String get temperatureDialogStep5 =>
      'Lấy nhiệt kế ra và ghi lại số đo thân nhiệt.';

  @override
  String get temperatureDialogCloseButton => 'ĐÓNG';

  @override
  String get shareAppDownloadPrompt =>
      'Hãy tải CovidNearMe xuống để nhận thông tin và số liệu thống kê về COVID-19 tại địa phương. Chung sức với cộng đồng bằng cách cung cấp thông tin về các triệu chứng theo cách ẩn danh! {{ APP_LINK }}';

  @override
  String get safetyTipsTitle => 'Cách giữ gìn sức khỏe';

  @override
  String get safetyTipsSubtitle =>
      'Những phương pháp hiệu quả giúp bảo vệ sức khỏe và chung sức với cộng đồng để ngăn chặn sự lây lan của dịch bệnh.';

  @override
  String get safetyTipsWashYourHands =>
      'Rửa tay thường xuyên bằng xà phòng và nước trong thời gian ít nhất 20 giây. Tránh đưa tay lên mắt, mũi và miệng, đặc biệt ở nơi công cộng. Luôn dùng phía bên trong khuỷu tay che miệng và mũi khi ho và hắt hơi.';

  @override
  String get safetyTipsSocialDistancing =>
      'Thực hiện biện pháp giữ khoảng cách tiếp xúc xã hội, tức là hạn chế tiếp xúc với những người khác. Duy trì khoảng cách tối thiểu là 1,8 m (6 feet) khi tiếp xúc với mọi người ở bên ngoài.';

  @override
  String get safetyTipsContactPhysician =>
      'Nếu các triệu chứng trở nên nặng hơn, hãy liên hệ với nhà cung cấp dịch vụ y tế.';

  @override
  String get locationStepTitle => 'Xác minh vị trí của bạn';

  @override
  String get locationStepInvalidZipCode =>
      'Vui lòng nhập một mã bưu chính hợp lệ gồm 5 chữ số';

  @override
  String get locationStepZipCode => 'Mã bưu chính';

  @override
  String get locationStepNoCountrySelected => 'Bạn chưa chọn quốc gia';

  @override
  String get locationStepCountrySearchPrompt =>
      'Vui lòng chọn quốc gia bạn đang sống';

  @override
  String get locationStepCountryButtonLabel => 'Quốc gia:';

  @override
  String get networkUnavailableBannerContinueOffline =>
      'TIẾP TỤC DÙNG MÀ KHÔNG CẦN MẠNG';

  @override
  String get networkUnavailableBannerConnectToWiFi => 'KẾT NỐI WI-FI';

  @override
  String get networkRequestError =>
      'Đã xảy ra lỗi nên yêu cầu của bạn chưa thể hoàn thành.';

  @override
  String get networkUnavailableBannerMessage =>
      'Có vẻ như bạn không có kết nối mạng. Vui lòng kiểm tra các tùy chọn cài đặt mạng của bạn rồi thử lại.';

  @override
  String get scrollMoreIndicatorMessage => 'CUỘN ĐỂ XEM THÊM';

  @override
  String get localStatisticsTitle =>
      'Số liệu thống kê về COVID-19 ở địa phương';

  @override
  String get localStatisticsNoLocationSelected =>
      'Chọn một vị trí để xem số liệu thống kê liên quan.';

  @override
  String get localStatisticsNoDataAvailable =>
      'Không tìm thấy dữ liệu nào về COVID-19 cho vị trí này.';

  @override
  String get localStatisticsLocationInput => 'Mã bưu chính hoặc quốc gia';

  @override
  String get localStatisticsRecentLocationsMenuTitle => 'Các vị trí gần đây';

  @override
  String get statisticsLabelCases => 'Số ca nhiễm';

  @override
  String get statisticsLabelDeaths => 'Số ca tử vong';

  @override
  String get statisticsLabelRecoveries => 'Số ca khỏi bệnh';
}
