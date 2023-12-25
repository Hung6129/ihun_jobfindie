part of 'network_service.dart';

class ApiProvider {
  // Auth
  static const String auth = 'v1/auth';
  static const String login = 'v1/auth/login';
  static const String logout = 'v1/auth/logout';
  static const String session = 'v1/auth/session';
  static const String refreshToken = 'v1/auth/token/refresh';
  static const String register = 'v1/auth/register';
  static const String appConfig = 'v1/config/app';
  static const String ssoConfig = "v1/config/sso";
  static const String authToken = 'v1/auth/token';
  static const String authMe = 'v1/auth/me';
  static const String thongTinCaNhan = 'v1/nhanVien/thongTinCaNhan';
  static const String qrcode = 'v1/nhanVien/thongTinCaNhan/qRCode';
  static const String authChangePassword =
      'v1/nhanVien/thongTinCaNhan/doiMatKhau';
  static const String exchangeAdToken = 'v1/auth/token/exchangeAdToken';

  // End Auth

  static const String notification = 'v1/notification';
  static const String notificationType = 'v1/notification/type';
  static const String notificationCount = 'v1/notification/count';
  static const String notificationMarkRead = 'v1/notification/markRead';
  static const String notificationMarkImportant =
      'v1/notification/markImportant';

  // Farmer
  static const String farmer = 'v1/nhanVien/quanLyNongDan/nongDanMoi';
  static const String farmerFC = 'v1/nhanVien/quanLyNongDan/nongDanFc';
  static const String farmerFCDuplicated =
      'v1/nhanVien/quanLyNongDan/nongDanFC/danhSachTrung';

  static const String uploadIdentify =
      'v1/nhanVien/quanLyNongDan/xacThucNongDan/ekyc/tachThongTin';
  static const String matchingFaceWithIdentify =
      'v1/nhanVien/quanLyNongDan/xacThucNongDan/ekyc/soKhopMat';

  static String farmerDetail(String farmerId) =>
      'v1/nhanVien/quanLyNongDan/nongDanMoi/$farmerId';

  static String informPTHDuplicateFarmerNew(String farmerId) =>
      'v1/nhanVien/quanLyNongDan/nongDanMoi/$farmerId/baoCaoTrung';

  static String informPTHDuplicateFarmerFC(String farmerId) =>
      'v1/nhanVien/quanLyNongDan/nongDanFC/$farmerId/baoCaoTrung';

  static String informPTHFarmerFCLocked(String farmerId) =>
      'v1/nhanVien/quanLyNongDan/nongDanFC/$farmerId/baoCaoCapNhatThongTin';

  // End Farmer

  // Fields
  static const String farmerField = 'v1/nhanVien/quanLyKhuDat/khuDat';
  static const String farmerNearestField =
      'v1/nhanVien/quanLyKhuDat/khuDat/locToaDo';

  static String fieldInformPTH({required String maKhuDat}) =>
      'v1/nhanVien/quanLyKhuDat/khuDat/$maKhuDat/baoPTH';

  static String fieldInformPTHDuplicatedLocation({required String maKhuDat}) =>
      'v1/nhanVien/quanLyKhuDat/khuDat/$maKhuDat/baodinhvipth';

  // End Fields

  // Plan
  static const String plan = "v1/nhanVien/keHoach";
  static const String groupPlan = 'v1/nhanVien/keHoach/nhom';
  static const String listFieldFarmer = 'v1/nhanVien/keHoach/nongDan';
  static const String listFieldFarmerOrder =
      'v1/nhanVien/donHang/dichVu/nongDanKhuDat';

  static String planDetail({required String planId}) => '$plan/$planId';

  static String uploadPLHD({required String maKeHoach}) =>
      'v1/nhanVien/keHoach/$maKeHoach/kyGiayPLHD';

  static String getFilePLHD(
          {required String maKeHoach, required String maPLHD}) =>
      'v1/nhanVien/keHoach/$maKeHoach/PLHD/$maPLHD';

  static String getPlanOtp({required String maKeHoach}) =>
      '${planDetail(planId: maKeHoach)}/kyLtCa';

  static String confirmPlanOtp({required String maKeHoach}) =>
      '${planDetail(planId: maKeHoach)}/kyLtCa/xacNhan';

  static String createEcontract({required String maKeHoach}) =>
      '${planDetail(planId: maKeHoach)}/kyFptCa';

  static String linkFptEcontract({required String maKeHoach}) =>
      '${planDetail(planId: maKeHoach)}/kyFptCa/trangThai';

  static String planEContractKindOf({required String maKeHoach}) =>
      '${planDetail(planId: maKeHoach)}/loaiChungTuDienTu';

  // End Plan

  // Order Service Inside
  static const String orderServiceInside =
      'v1/nhanVien/donHang/dichVu/trongVNL';

  static const String orderServiceInsideV2 =
      'v2/nhanVien/donHang/dichVu/trongVNL';

  static String orderServiceInsideDetail(String orderId) =>
      '$orderServiceInside/$orderId';

  static String orderServiceInsideConfirm(String orderId) =>
      '${orderServiceInsideDetail(orderId)}/xacNhan';

  static String orderServiceInsideUpdateProgress(String orderId) =>
      '$orderServiceInside/$orderId/thucHien';

  static String orderServiceInsideUploadPLHD({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/kyGiay';

  static String confirmOrderServiceInsideFinish({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/xacNhanThucHien';

  static String confirmOrderServiceInsideDone({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/xacNhanNghiemThu';

  static String getOrderServiceInsideContract({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/bienBan';

  static orderServiceInsideContractDetail(
          {required String orderId, required String fileId}) =>
      '${orderServiceInsideDetail(orderId)}/bienBan/$fileId';

  static orderServiceInsideFinishDetail(
          {required String orderId, required String id}) =>
      '${orderServiceInsideDetail(orderId)}/chiTietThucHien/$id';
  static const String orderServiceInsideMasterService =
      '$orderServiceInside/danhMucDichVu';

  static const String orderServiceInsideMasterServiceV2 =
      '$orderServiceInsideV2/danhMucDichVu';

  static orderServiceInsideMasterMachine({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/danhSachMay';

  static orderServiceInsideDeleteContractDetail(
          {required String orderId, required String fileId}) =>
      '${orderServiceInsideDetail(orderId)}/kyGiay/$fileId';

  static orderServiceInsideUpdateEcontractField({required String orderId}) =>
      '${orderServiceInsideDetail(orderId)}/chungTuDienTu';
  // End Order Service Inside

  // Order Service Outside
  static const String orderServiceOutside =
      'v1/nhanVien/donHang/dichVu/ngoaiVNL';

  static const String orderServiceOutsideV2 =
      'v2/nhanVien/donHang/dichVu/ngoaiVNL';

  static String orderServiceOutsideDetail(String orderId) =>
      '$orderServiceOutside/$orderId';

  static String orderServiceOutsideConfirm(String orderId) =>
      '${orderServiceOutsideDetail(orderId)}/xacNhan';

  static String orderServiceOutsideUpdateProgress(String orderId) =>
      '$orderServiceOutside/$orderId/thucHien';

  static String orderServiceOutsideUploadPLHD({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/kyGiay';

  static String confirmOrderServiceOutsideFinish({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/xacNhanThucHien';

  static String confirmOrderServiceOutsideDone({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/xacNhanNghiemThu';

  static String getOrderServiceOutsideContract({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/bienBan';

  static orderServiceOutsideContractDetail(
          {required String orderId, required String fileId}) =>
      '${orderServiceOutsideDetail(orderId)}/bienBan/$fileId';

  static orderServiceOutsideFinishDetail(
          {required String orderId, required String id}) =>
      '${orderServiceOutsideDetail(orderId)}/chiTietThucHien/$id';
  static const String orderServiceOutsideMasterService =
      '$orderServiceOutside/danhMucDichVu';

  static const String orderServiceOutsideMasterServiceV2 =
      '$orderServiceOutsideV2/danhMucDichVu';

  static orderServiceOutsideMasterMachine({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/danhSachMay';

  static orderServiceOutsideDeleteContractDetail(
          {required String orderId, required String fileId}) =>
      '${orderServiceOutsideDetail(orderId)}/kyGiay/$fileId';

  static orderServiceOutsideUpdateEcontractField({required String orderId}) =>
      '${orderServiceOutsideDetail(orderId)}/chungTuDienTu';
  // End Order Service Outside

  static orderServiceConfirmOtpLtCa(
          {required String orderId, required bool isInside}) =>
      isInside
          ? '${orderServiceInsideDetail(orderId)}/kyLtCa/xacNhan'
          : '${orderServiceOutsideDetail(orderId)}/kyLtCa/xacNhan';

  static orderServiceEcontractKindOf(
          {required String orderId, required bool isInside}) =>
      isInside
          ? '${orderServiceInsideDetail(orderId)}/loaiChungTuDienTu'
          : '${orderServiceOutsideDetail(orderId)}/loaiChungTuDienTu';

  static orderServiceCreateFptEcontract(
          {required String orderId, required bool isInside}) =>
      isInside
          ? '${orderServiceInsideDetail(orderId)}/kyFptCa'
          : '${orderServiceOutsideDetail(orderId)}/kyFptCa';

  static orderServiceCreateLtEcontract(
          {required String orderId, required bool isInside}) =>
      isInside
          ? '${orderServiceInsideDetail(orderId)}/kyLtCa'
          : '${orderServiceOutsideDetail(orderId)}/kyLtCa';

  static orderServiceLinkFptEcontract(
          {required String orderId, required bool isInside}) =>
      isInside
          ? '${orderServiceInsideDetail(orderId)}/kyFptCa/trangThai'
          : '${orderServiceOutsideDetail(orderId)}/kyFptCa/trangThai';

  // Order Detail
  static const String orders = 'v1/nhanVien/donHang/vatTu/donChiTiet';

  static String orderDetail(String orderId) => '$orders/$orderId';

  static String orderSingleConfirm(String orderId) =>
      '${orderDetail(orderId)}/xacNhan';
  static const String listFarmersAndFields = '$orders/danhSachNongDanKhuDat';
  static const String orderSupplyInside = '$orders/vatTuTrongDinhVi';
  static const String orderSupplyOutside = '$orders/vatTuNgoaiDinhVi';

  static String orderSupplyDetail(
          {required String orderId, required String fieldId}) =>
      '${orderDetail(orderId)}/khuDat/$fieldId/vatTu';

  // End Order Detail

  // Order Merged
  static const String orderListMerged = 'v1/nhanVien/donHang/vatTu/donTong';

  static String orderDetailMerged(String orderId) =>
      '$orderListMerged/$orderId';

  static String orderMergedGetOtp(String orderId) =>
      '${orderDetailMerged(orderId)}/layOtp';

  static String orderMergedSubmitOtp(String orderId) =>
      '${orderDetailMerged(orderId)}/xacNhanOtp';

  static String getFileReport(
          {required String soPhieu, required String maFile}) =>
      '${orderDetailMerged(soPhieu)}/bienBan/$maFile';

  static String orderMergedConfirm(String orderId) =>
      '${orderDetailMerged(orderId)}/xacNhan';

  static String orderMergedUploadPLHD({required String orderId}) =>
      '${orderDetailMerged(orderId)}/uploadBienBan';

  static String orderSupplyDetailMerged(
          {required String orderId, required String fieldId}) =>
      '${orderDetailMerged(orderId)}/khuDat/$fieldId/vatTu';

  static String orderSupplyDetailMergedNeedToScan(
          {required String orderId, required String fieldId}) =>
      '${orderDetailMerged(orderId)}/khuDat/$fieldId/danhSachVatTuQuetQrCode';

  static String orderSupplyDetailMergedCheckQRCode(
          {required String orderId, required String fieldId}) =>
      '${orderDetailMerged(orderId)}/khuDat/$fieldId/kiemTraQrCode';

  static String orderSupplyDetailMergedConfirmQRCode(
          {required String orderId, required String fieldId}) =>
      '${orderDetailMerged(orderId)}/khuDat/$fieldId/xacNhanQrCode';

  static String orderMergedCreateFptEcontract({required String orderId}) =>
      '${orderDetailMerged(orderId)}/kyFptCa';

  static String orderMergedLinkEcontract({required String orderId}) =>
      '${orderDetailMerged(orderId)}/kyFptCa/trangThai';

  static const String orderDiarySupply = 'v1/nhanVien/nhatKyCanhTac/vatTu';

  // End Order Merged

  // Diary Farmer
  static const String farmingDiaryGroupPlan =
      'v1/nhanVien/nhatKyCanhTac/nhomKeHoach';

  // Diary Farmer 3C
  static const String groupDiaryFramer3C = 'v1/nhanVien/nhatKyCanhTac3C/nhom';
  static const String diaryFramer3C = 'v1/nhanVien/nhatKyCanhTac3C';
  static const String farmingDiaryListPlan3C = '$diaryFramer3C/keHoach';

  static String detailDiaryFramer3C({required String maNhatKy}) =>
      '$diaryFramer3C/$maNhatKy';

  static String diaryFramerUpdate3C(String maNhatKy) =>
      '$diaryFramer3C/$maNhatKy/nhatKy';

  static String diaryFramerCopy3C(
          {required String maNhatKy, required String maChiTietNhatKy}) =>
      '${diaryFramerUpdate3C(maNhatKy)}/$maChiTietNhatKy/saoChep';

  static String diaryStep3C({required String diaryId}) =>
      'v1/nhanVien/nhatKyCanhTac3C/$diaryId/danhSachBuoc';

  static String createDiaryStep3C({required String diaryId}) =>
      'v1/nhanVien/nhatKyCanhTac3C/$diaryId/nhatKy';

  static String removeDiaryFramer3C({required String maNhatKy}) =>
      '$diaryFramer3C/$maNhatKy/nhatKy';

  // End Diary Farmer 3C

  // Diary Farmer SC
  static const String groupDiaryFramerSC = 'v1/nhanVien/nhatKyCanhTacSC/nhom';
  static const String diaryFramerSC = 'v1/nhanVien/nhatKyCanhTacSC';
  static const String farmingDiaryListPlanSC = '$diaryFramerSC/keHoach';

  static String detailDiaryFramerSC({required String maNhatKy}) =>
      '$diaryFramerSC/$maNhatKy';

  static String diaryFramerUpdateSC(String maNhatKy) =>
      '${detailDiaryFramerSC(maNhatKy: maNhatKy)}/nhatKy';

  static String diaryFramerCopySC(
          {required String maNhatKy, required String maChiTietNhatKy}) =>
      '${diaryFramerUpdateSC(maNhatKy)}/$maChiTietNhatKy/saoChep';

  static String diaryStepSC({required String diaryId}) =>
      'v1/nhanVien/nhatKyCanhTacSC/$diaryId/danhSachBuoc';

  static String createDiaryStepSC({required String diaryId}) =>
      'v1/nhanVien/nhatKyCanhTacSC/$diaryId/nhatKy';

  static String removeDiaryFramerSC({required String maNhatKy}) =>
      '$diaryFramerSC/$maNhatKy/nhatKy';

  // End Diary Farmer SC

  // Update Progress
  static const String groupUpdateProgress = 'v1/nhanVien/tienDoThucHien/nhom';
  static const String updateProgress = 'v1/nhanVien/tienDoThucHien';

  static String updateProgressDetail({required String progressId}) =>
      '$updateProgress/$progressId';

  static String updateProgressConfirm({required String progressId}) =>
      '$updateProgress/$progressId/xacNhan';
  static String updateProgressDelete(String progressId) =>
      '$updateProgress/$progressId';
  // End Update Progress
  // End Order Merged

  // Contract transfer
  static const String contract = 'v1/masterData/hopDong';
  static const String fieldWithContract =
      'v1/nhanVien/dieuChuyenHopDong/khuDat';
  static const String contractTransfer = 'v1/nhanVien/dieuChuyenHopDong';

  static String contractTransferWithId({required String contractId}) =>
      '$contractTransfer/$contractId';

  static String contractTransferConfirmWithId({required String contractId}) =>
      '${contractTransferWithId(contractId: contractId)}/xacNhan';
  static const String contractFieldFarmer =
      'v1/masterData/nongDanKhuDatHopDong';

  // End Contract transfer

  // Planting Area
  static const String plantingArea = 'v1/phanHeDanhMuc/vungTrong';
  static const String plantingAreaField = 'v1/phanHeDanhMuc/khuDat';

  static String plantingFieldDetail(
          {required String plantingId, required String fieldId}) =>
      '$plantingArea/$plantingId/khuDat/$fieldId';

  // End Planting Area

  // Agricultural Supply Area
  static const String agricultural = 'v1/nhanVien/dangKyVTNN';

  static String agriculturalDetail({required String soPhieu}) =>
      '$agricultural/$soPhieu';
  static const String confirmAgriculturalSupply = '$agricultural/duyet';

  static String get getAgriculturalSupplyForRegister =>
      '$agricultural/dinhViCanhTac';

  static String get getPreviousAgriculturalSupplyForRegister =>
      '$agricultural/keThua';

  static String get agriculturalFields => '$agricultural/khuDat';

  static String get checkAgriculturalSupplyForRegister =>
      '$agricultural/kiemTra';
  static const String getPlanProductivity = '$agricultural/keHoach';

  // End Agricultural Supply Area

  // Master Data
  static const String masterDataLocation = 'v1/masterData/donViHanhChinh';
  static const String master3C = 'v1/masterData/nhanVien';
  static const String master3CPermittedLocation =
      'v1/masterData/phanQuyenDiaPhuong';
  static const String masterStaffPermissions = 'v2/nhanVien/phanQuyen/chucNang';

  static const String masterCrop = 'v1/masterData/muaVu';
  static const String master3CPermittedHTX = 'v1/nhanVien/phanQuyen/htxTht';
  static const String masterCategoryHTX = 'v1/masterData/htxTht';
  static const String masterCategoryTHT = 'v1/masterData/tht';

  static String masterCategoryHTXDetail({required String coopSocietyId}) =>
      '$masterCategoryHTX/$coopSocietyId';

  static String masterCategoryTHTDetail({required String coopGroupId}) =>
      '$masterCategoryTHT/$coopGroupId';

  static String masterDetailPlant({required String plantId}) =>
      'v1/masterData/nangSuatKeHoach/$plantId';
  static const String masterSupplies = 'v1/danhMuc/vatTu';
  static const String agencyS1 = 'v1/masterData/khachHangS1';
  static const String agencyS2 = 'v1/masterData/khachHangS2';
  static const String moneyProvideTime = 'v1/masterData/dotUng';
  static const String cropStage = 'v1/masterData/giaiDoan';
  static const String farmingSupply = 'v1/masterData/vatTu';
  static const String subject = 'v1/masterData/doiTuongLam';
  static const String serviceSupplyType = 'v1/masterData/loaiVatTuDichVu';
  static const String masterPlantingArea = 'v1/phanHeDanhMuc/vungTrong';
  static const String masterFarmer = 'v1/nhanVien/dangKyVTNN/khuDat';
  static const String masterPlantAge = 'v1/masterData/tuoiCay';
  static const String masterService = 'v1/masterData/dichVu';
  static const String masterMachine = 'v1/masterData/may';
  static const String masterCustomerType = 'v1/masterData/loaiKhachHang';
  static const String masterTeam3C = 'v1/masterData/to3C';
  static const String masterPlant = 'v1/masterData/cayTrong';
  static const String masterStandard = 'v1/masterData/tieuChuan';
  static const String masterBreed = 'v1/masterData/giong';
  static const String coopGroupSociety = 'v1/phanHeDanhMuc/hopTacXaToHopTac';

  static String coopGroupSocietyDetail({required String coopSocietyId}) =>
      '$coopGroupSociety/$coopSocietyId';
  static const String masterTransport = 'v1/masterData/vanChuyenVe';
  static const String masterSaleChannel = 'v1/masterData/kenhBanHang';
  static const String masterFieldByFarmer = 'v1/masterData/khuDat';
  static const String masterStatus = 'v1/masterData/trangThaiChungTu';
  static const String masterTransportStatus =
      'v1/masterData/trangThaiVanChuyen';
  static const String masterVehicle = 'v1/masterData/phuongTien';
  static const String paymentRequestType = "v1/masterData/loaiDeNghiThanhToan";
  static const String paymentAgency = "v1/masterData/donViThanhToan";
  static const String linkContractType = "v1/masterData/loaiHopDongLienKet";
  static const String masterDataPriceTransport = "v1/masterData/chinhSachGia";
  static const String masterDataCanalLoad = "v1/masterData/taiTrongKenh";
  static String masterDetailPlantV2 = 'v1/masterData/nangSuatKeHoach';
  static const String masterDataDocument = "v1/masterData/chungTu";

  // End Master Data

  // History Change
  static String historyChange = 'lichSuChinhSua';

  static String historyChangeOrderServiceInside(String id) =>
      '$orderServiceInside/$id/$historyChange';

  static String historyChangeOrderServiceOutside(String id) =>
      '$orderServiceOutside/$id/$historyChange';

  static String historyChangeOrderDetail(String id) =>
      '$orders/$id/$historyChange';

  static String historyChangeOrderMerge(String id) =>
      '$orderListMerged/$id/$historyChange';

  static String historyChangePlan(String id) => '$plan/$id/$historyChange';

  static String historyChangeContractTransfer(String id) =>
      '$contractTransfer/$id/$historyChange';

  static String historyChangeSupplyRegister(String id) =>
      '$agricultural/$id/$historyChange';

  static String historyChangeFieldDiary3C(String id) =>
      '$diaryFramer3C/$id/$historyChange';

  static String historyChangeFieldDiarySC(String id) =>
      '$diaryFramerSC/$id/$historyChange';

  static String historyChangeProgress(String id) =>
      '$updateProgress/$id/$historyChange';

  static String historyChangeFarmer(String id) => '$farmer/$id/$historyChange';

  static String historyChangeFarmerFC(String id) =>
      '$farmerFC/$id/$historyChange';

  static String historyChangeFinalizePriceCalendarInside(String id) =>
      '${finalizePriceCalendarDetailInside(id)}/$historyChange';

  static String historyChangeRegisterOutside(String id) =>
      '$registerOutside/$id/$historyChange';

  static const String geoCode = 'v1/geoCode';

  ///---------------PHASE 2-------------------------

  // Finalize Price Calendar Inside
  static String finalizePriceCalendarInside =
      'v1/nhanVien/lichChotGia/trongVnl';
  static String finalizePriceCalendarOutside =
      'v1/nhanVien/lichChotGia/ngoaiVnl';
  static String fieldForFinalizePriceCalendarInsideChuaTaoLich =
      '$finalizePriceCalendarInside/danhSachXuongGiongThucTe/chuaTaoLich';
  static String fieldForFinalizePriceCalendarInsideBanNgoai =
      '$finalizePriceCalendarInside/danhSachXuongGiongThucTe/banNgoai';

  static String finalizePriceCalendarDetailInside(String soPhieu) =>
      '$finalizePriceCalendarInside/$soPhieu';

  static String confirmFinalizePriceCalendarInside(String soPhieu) =>
      '$finalizePriceCalendarInside/$soPhieu/xacNhan';

  static String get finalizePriceCalendarInsideFarmer =>
      '$finalizePriceCalendarInside/danhSachNongDanTheoHopDong';

  static String get finalizePriceCalendarInsideField =>
      '$finalizePriceCalendarInside/danhSachKhuDatTheoHopDong';

  // End Finalize Price Calendar Inside

  // Confirm Finalize Price
  static const String confirmFinalizePrice = 'v1/nhanVien/xacNhanChotGia';
  static const String confirmFinalizePriceInside =
      '$confirmFinalizePrice/trongVnl';
  static const String confirmFinalizePriceOutside =
      '$confirmFinalizePrice/ngoaiVnl';

  static String confirmFinalizePriceInsideDetail(String detailId) =>
      '$confirmFinalizePriceInside/$detailId';

  static String historyChangeConfirmFinalizePriceInsideDetail(
          String detailId) =>
      '$confirmFinalizePriceInside/$detailId/$historyChange';

  static String updateFinalizePriceInsideDetail(String detailId) =>
      '$confirmFinalizePriceInside/$detailId/capNhat';

  static String confirmConfirmFinalizePriceInsideDetail(String detailId) =>
      '$confirmFinalizePriceInside/$detailId/xacNhan';

  static String deleteConfirmFinalizePriceInsideDetail(String detailId) =>
      '$confirmFinalizePriceInside/$detailId';

  static String historyChangeConfirmFinalizePriceInsideDetailField(
    String detailId,
    String fieldId,
  ) =>
      '$confirmFinalizePriceInside/$detailId/nongDanKhuDat/$fieldId/$historyChange';

  static String confirmFinalizePriceInsideOtpRequest(String detailId) =>
      '$confirmFinalizePriceInside/$detailId/nongDanXacNhan/layOtp';

  static String confirmFinalizePriceInsideOtpSubmit(String detailId) =>
      '$confirmFinalizePriceInside/$detailId/nongDanXacNhan/xacNhanOtp';

  static String confirmFinalizePriceInsideUploadBB(
          {required String detailId}) =>
      '${confirmFinalizePriceInsideDetail(detailId)}/bienBan/upload';

  static String confirmFinalizePriceInsideDownloadBB(
          {required String detailId, required String maFile}) =>
      '${confirmFinalizePriceInsideDetail(detailId)}/bienBan/$maFile';

  static String confirmFinalizePriceInsideDeleteBB(
          {required String detailId,
          required String maFile,
          required String maBienBan}) =>
      '${confirmFinalizePriceInsideDetail(detailId)}/bienBan/kyGiay/$maFile/$maBienBan';

  static String confirmFinalizePriceInsideCreateEcontractFptca(
          {required String soPhieu}) =>
      '${confirmFinalizePriceInsideDetail(soPhieu)}/kyFPTCA';

  static String confirmFinalizePriceInsideCreateEcontractLtca(
          {required String soPhieu}) =>
      '${confirmFinalizePriceInsideDetail(soPhieu)}/kyLTCA';

  static String confirmFinalizePriceInsideEContractKindOf(
          {required String soPhieu}) =>
      '${confirmFinalizePriceInsideDetail(soPhieu)}/loaiChungTuDienTu';

  static String get confirmFinalizePriceInsideFarmer =>
      '$confirmFinalizePriceInside/danhSachNongDanTheoHopDong';

  static String get confirmFinalizePriceInsideField =>
      '$confirmFinalizePriceInside/danhSachKhuDatTheoHopDong';

  static String confirmFinalizePriceInsideEcontractType(
          {required String soPhieu}) =>
      '${confirmFinalizePriceInsideDetail(soPhieu)}/loaiChungTuDienTu';

  static String confirmFinalizePriceOutsideEcontractType(
          {required String soPhieu}) =>
      '${confirmFinalizePriceInsideDetail(soPhieu)}/loaiChungTuDienTu';

  static String confirmFinalizePriceInsideSyncUp({required String soPhieu}) =>
      '$confirmFinalizePriceInside/$soPhieu/dongBoLen';

  // End Confirm Finalize Price

  // Vehicle Coordination
  static String vehicleCoordination = "v1/nhanVien/dieuPhuongTien";

  static String vehicleCoordinationGroupInfo =
      "$vehicleCoordination/thongTinNhom";

  static String vehicleCoordinationDetail({required String maID}) =>
      "$vehicleCoordination/$maID";

  static String copyVehicleCoordinationDetail({required String maID}) =>
      "$vehicleCoordination/$maID/saoChep";

  static String historyChangeVehicleCoordinationDetail(String detailId) =>
      '$vehicleCoordination/$detailId/$historyChange';
  static String confirmAllVehicleCoordinationGroup =
      "$vehicleCoordination/xacNhanNhanh";

  static String confirmVehicleCoordination({required String detailId}) =>
      "$vehicleCoordination/$detailId/xacNhan";
  static String vehicleCoordinationGroup = '$vehicleCoordination/nhom';
  static String vehicleCoordinationGroupOutside =
      '$vehicleCoordination/ngoaiVnl/nhom';
  static String vehicleCoordinationMultipleUpdate =
      '$vehicleCoordination/capNhatNhanh';

  static String get vehicleCoordinationStatus =>
      '$vehicleCoordination/danhSachTrangThai';

  // End Vehicle Coordination

  // Purchase Transport
  static String purchaseTransport = "v1/nhanVien/thuMuaVanChuyen/trongVnl";
  static String purchaseTransportOutside =
      "v1/nhanVien/thuMuaVanChuyen/ngoaiVnl";
  static String purchaseTransportDetail({required String maID}) =>
      '$purchaseTransport/$maID';

  static String purchaseTransportGroupInside = '$purchaseTransport/nhom';

  static String purchaseTransportGroupOutside =
      '$purchaseTransportOutside/nhom';

  static String historyChangePurchaseTransportDetail(String maID) =>
      '$purchaseTransport/$maID/$historyChange';

  static String purchaseTransportConfirm({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/xacNhan';

  static String purchaseTransportSplit({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/tach';

  static String purchaseTransportDownloadBB(
          {required String maID, required String maFile}) =>
      '${purchaseTransportDetail(maID: maID)}/bienBan/$maFile';

  static String purchaseTransportUploadBB({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/bienBan/upload';

  static String purchaseTransportDeleteBB(
          {required String maID, required String maFile}) =>
      '${purchaseTransportDetail(maID: maID)}/bienBan/$maFile';

  static String purchaseTransportEcontractType({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/loaiChungTuDienTu';

  static String purchaseTransportCreateEcontractFptca({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/kyFPTCA';

  static String purchaseTransportLinkFptEcontract({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/kyFPTCA/trangThai';

  static String purchaseTransportCreateEcontractLtca({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/kyLTCA';

  static String purchaseTransportConfirmEcontractLtca({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/kyLTCA/xacNhan';

  static String purchaseTransportGetOtp({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/yeuCauOtp';

  static String purchaseTransportConfirmOtp({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/xacNhanOtp';

  static String purchaseTransportSyncUp({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/dongBoLen';

  static String purchaseTransportCreateNumberWeight({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/khoiTaoPhieuCan';

  static String purchaseTransportCloseWeight({required String maID}) =>
      '${purchaseTransportDetail(maID: maID)}/dongPhieuCan';

  static String get purchaseTransportInsideFarmer =>
      '$purchaseTransport/danhSachNongDanTheoHopDong';

  static String get purchaseTransportInsideField =>
      '$purchaseTransport/danhSachKhuDatTheoHopDong';

  // End Purchase Transport

  // Payment Request
  static String paymentRequest = "v1/nhanVien/deNghiThanhToan";
  static String traditional = "moHinhTruyenThong";
  static String lT123 = "moHinh123";

  static String paymentRequestURL({required bool isTraditional}) =>
      "$paymentRequest/${isTraditional ? traditional : lT123}";

  // Tao
  static String paymentRequestCreate({
    required bool isTraditional,
  }) =>
      "${paymentRequestURL(isTraditional: isTraditional)}/tao";

  static String paymentRequestCreateListField({
    required bool isTraditional,
  }) =>
      "${paymentRequestCreate(isTraditional: isTraditional)}/danhSachKhuDat";

  static String paymentRequestCreateDetailField({
    required bool isTraditional,
  }) =>
      "${paymentRequestCreate(isTraditional: isTraditional)}/thongTinKhuDat";

  // Chi tiet
  static String paymentRequestAction({
    required bool isTraditional,
    required String soDeNghi,
  }) =>
      "${paymentRequestURL(isTraditional: isTraditional)}/$soDeNghi";

  static String paymentRequestDetailField({
    required bool isTraditional,
    required String soDeNghi,
    required String maID,
  }) =>
      "${paymentRequestAction(isTraditional: isTraditional, soDeNghi: soDeNghi)}/khuDat/$maID";

  static String historyChangePaymentRequestDetailFieldTraditional(
    String soDeNghi,
    String maID,
  ) =>
      '$paymentRequest/$traditional/$soDeNghi/khuDat/$maID/$historyChange';

  static String historyChangePaymentRequestDetailFieldLT123(
    String soDeNghi,
    String maID,
  ) =>
      '$paymentRequest/$lT123/$soDeNghi/khuDat/$maID/$historyChange';

  // Actions
  static String paymentRequestConfirm({
    required bool isTraditional,
    required String soDeNghi,
  }) =>
      "${paymentRequestAction(isTraditional: isTraditional, soDeNghi: soDeNghi)}/xacNhan";

  static String paymentRequestRequestOTP({
    required bool isTraditional,
    required String soDeNghi,
    required String maID,
  }) =>
      '${paymentRequestDetailField(isTraditional: isTraditional, soDeNghi: soDeNghi, maID: maID)}/nongDanXacNhan/yeuCauOtp';

  static String paymentRequestConfirmOTP({
    required bool isTraditional,
    required String soDeNghi,
    required String maID,
  }) =>
      '${paymentRequestDetailField(isTraditional: isTraditional, soDeNghi: soDeNghi, maID: maID)}/nongDanXacNhan/xacNhanOtp';
// End Payment Request

// Recall Public Debt
  static String recallDebt = "v1/nhanVien/thuHoiCongNo";

  static String recallDebtGroup = "$recallDebt/nhom";

  static String recallDebtAction({required String soPhieu}) =>
      "$recallDebt/$soPhieu";

  static String recallDebtConfirm({required String soPhieu}) =>
      "$recallDebt/$soPhieu/xacNhan";

  static String recallDebtSplit({required String soPhieu}) =>
      "$recallDebt/$soPhieu/saoChep";

  static String historyChangeRecallDebtDetail(String soPhieu) =>
      '$recallDebt/$soPhieu/$historyChange';

  static String recallDebtRequestOTP({required String soPhieu}) =>
      '${recallDebtAction(soPhieu: soPhieu)}/nongDanXacNhan/layOtp';

  static String recallDebtConfirmOTP({required String soPhieu}) =>
      '${recallDebtAction(soPhieu: soPhieu)}/nongDanXacNhan/xacNhanOtp';
// End Recall Public Debt

// Register Outside

  static String registerOutside = 'v1/nhanVien/dangKyBanLuaNgoaiVnl';
  static String registerOutsideDetail({required String soPhieu}) =>
      '$registerOutside/$soPhieu';
  static String registerOutsideDetailConfirm({required String soPhieu}) =>
      '${registerOutsideDetail(soPhieu: soPhieu)}/xacNhan';
  static String registerOutsideFindFarmer = '$registerOutside/timNongDan';
  static String registerOutsideFarmer = '$registerOutside/nongDan';
  static String registerOutsideField = '$registerOutside/khuDat';
  static String registerOutsideFarmerForFilter =
      '$registerOutside/boLoc/nongDan';

// End Register Outside

// Report
  static String report = "v1/nhanVien";
  static String listReportType = "$report/baoCao";
  static String listReportFilterCondition({required String maBaoCao}) =>
      '$listReportType/$maBaoCao/dieuKienLoc';
  static String listReportFilterConditionData({required String maBaoCao}) =>
      '$listReportType/$maBaoCao/duLieuLoc';
  static String listReportDownloadFile = '$listReportType/tepTin';
  static String reportDownloadFile(
          {required String maBaoCao, required String maFile}) =>
      '$listReportType/$maBaoCao/tepTin/$maFile';
// End Report

// Centralized Verify Start
  static const String centralizeVerify = "v1/nhanVien/duyetTapTrung";

  static String centralizeVerifyList() => '$centralizeVerify/danhSachChungTu';

  static String centralizeVerifyListHint() => '$centralizeVerify/danhSachGoiY';

  static String centralizeVerifyVerify(String maChungTu) =>
      '$centralizeVerify/$maChungTu/duyet';

  static String centralizeVerifyUnverify(String maChungTu) =>
      '$centralizeVerify/$maChungTu/goDuyet';

  static String centralizeVerifyReject(String maChungTu) =>
      '$centralizeVerify/$maChungTu/tuChoiDuyet';

  static const String centralizeVerifyPermission =
      'v1/nhanVien/phanQuyen/duyetTapTrung';

// Centralized Verify End

  /// Search
  static const String globalSearchCategory =
      'v1/globalSearch/danhMucLoaiDoiTuongTimKiem';
  static const String globalSearch = 'v1/globalSearch/search';
// Tong Quan Cong Viec Start
  static const String tongQuanCongViec = 'v1/nhanVien/tongQuanCongViec';
  static String tongQuanCongViecChiTiet(String maTacVu) =>
      'v1/nhanVien/tongQuanCongViec/$maTacVu';

// Tong Quan Cong Viec End
}
