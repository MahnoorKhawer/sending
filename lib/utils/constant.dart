import 'package:flutter/material.dart';

class Constant {
  static const appTitle = "TaskBuddy";
  static const languageEn = "en";
  static const countryCodeEn = "US";
  static const fontFamilyNunito = "Nunito";
  static const fontFamilyPoppins = "Poppins";
  static const fontFamilyNunitoSans = "NunitoSans";
  static const fontFamilyRighteous = "Righteous";
  static const fontFamilyLexendDeca = "LexendDeca";
  static const validationTypeEmail = "Email";
  static const validationTypePhone = "Phone";
  static const validationTypePassword = "Password";
  static const validationTypeUserName = "UserName";
  static const validationTypeBirthDate = "BirthDate";
  static const validationTypeEmpty = "Empty";

  static const boolValueTrue = true;
  static const boolValueFalse = false;

  ///
  ///
  static var idEmailInput = 'idEmailInput';
  static var idNameInput = 'idNameInput';

  static var idPasswordInput = 'idPasswordInput';
  static var idConfirmPasswordInput = 'idConfirmPasswordInput';
  static var idUserNameInput = 'idUserNameInput';

  static var idUserBirthDateInput = 'idUserBirthDateInput';

  static var idUserAgeInput = 'idUserAgeInput';
  static var idProfilePhoto = 'idProfilePhoto';
  static var idSelectGender = 'idSelectGender';
  static var idUserEmail = 'idUserEmail';
  static var idUserPhone = 'idUserPhone';
  static var idUserAddress = 'idUserAddress';

  /// userType
  static const appRoleUser = "USER";
  static const appRoleTasker = "TASKER";
  static var idSelectAlertSound = 'idSelectAlertSound';
  static var idPageView = 'idPageView';

  static var idChangeLanguage = 'idChangeLanguage';
  static const appThemeLight = "LIGHT";
  static const appThemeDark = "DARK";
  // static String privacyPolicyURL = "Add your privacy policy link here";
  static String privacyPolicyURL = "Add your privacy policy link here";

  static String aboutUsURL = "Add your About Us Url link here";

  /// Terms & condition URL
  static const termsAndConditionURL = "Add your terms and condition link here";

  static String googlePlayIdentifier = "Add your google Play Identifier here";

  static getAsset() => "assets/";

  static getAssetIcons() => "assets/icons/";
  static getAssetItem() => "assets/item/";

  static getAssetBackground() => "assets/background/";

  static getAssetImage() => "assets/images/";

  static List<String> genderList = const ['Male', 'Female', 'Other'];

  /// <<===================>> ****** Widget Id's for refresh in GetX ****** <<===================>>

  static var idProVersionProgress = 'idProVersionProgress';

  static const idSelectedImage = 'idSelectedImage';
  static const idSelectedColor = 'idSelectedColor';
  static const idSettingsTheme = "idSettingsTheme";
  static const idHome = "idHome";
  static const idSetting = "idSetting";
  static const isUserActive = "isUserActive";
  static const isMedicineDetails = "isMedicineDetails";
  static const idDrawerSheet = "idDrawerSheet";
  static const idMedicineList = "idMedicineList";
  static const idAppointmentList = "idAppointmentList";
  static const idAppointmentListItem = "idAppointmentListItem";

  ///Navigation Arguments
  static const idImageArg = 'idImageArg';
  static const idColorArg = 'idColorArg';
  static const idIsEditProfile = 'idIsEditProfile';
  static const idIsFromLogIn = 'idIsFromLogIn';
  static const idIsReSchedule = 'idIsReSchedule';
  static const idAppointmentHistoryTable = 'idAppointmentHistoryTable';
  static const isFromMedicineOrAppointment = 'isFromMedicineOrAppointment';
  static const idMemberId = 'idMemberId';

  //
  /// Your monthly Plan ID (Product ID iOS)
  static const String productIdiOS = "monthly_plan";
//"Enter Your monthly Plan ID (Product ID iOS)";

  /// 'Your yearly Plan ID (Product ID iOS)';
  static const String productIdiOSYearly = "yearly_plan";
  //"Enter Your yearly Plan ID (Product ID iOS)";

  /// 'Your Plan ID (Product ID Android)';
  static const String productIdAndroid =
      "pro_version"; // "Enter Your Plan ID (Product ID Android)";
}

class ColorPicker {
  Color color;
  bool isSelected;
  int indexColor;

  ColorPicker(
      {required this.indexColor,
        required this.color,
        required this.isSelected});
}
