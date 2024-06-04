import 'dart:io';
import 'package:vendor_app/Views/Auth/Login/loginManager.dart';
import 'package:vendor_app/Views/Auth/Sign_Up/signupManager.dart';
import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryManager.dart';
import 'package:vendor_app/Views/Home/User/Shopping/shopping_manager.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_manager.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Manager.dart';
import 'package:vendor_app/Views/Home/User/vendor_List/VendorListManager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseManager.dart';
import '../Views/Admin_Panel/Order_Details/Order_Details/admin_order_details_manager.dart';
import '../Views/Admin_Panel/Order_Details/component/Admin_Vendor_Types/admin_vendor_type_manager.dart';
import '../Views/Auth/Forgot/forgotManager.dart';
import '../Views/Auth/NewPassword/newpasswordManager.dart';
import '../Views/Auth/Otp/otpManager.dart';
import '../Views/Auth/Sign_otp/signOtpManager.dart';
import '../Views/Home/User/Inquiry_Form_Fill/Choice_ShowCase/choiceShowCaseManager.dart';
import '../Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_manager.dart';
import '../Views/Home/User/Listing_ShowCase_User/Listing_User/userLstingManager.dart';
import '../Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseManager.dart';
import '../Views/Home/User/Survey_Form_View/user_survey_form_view_manager.dart';
import '../Views/Home/User/User_Profile/Get_User_Profile/user_profileManager.dart';
import '../Views/Home/User/Vendor_type/vendor_type_manager.dart';
import '../Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_manager.dart';
import '../Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorLstingManager.dart';
import '../Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Manager.dart';
import '../Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileManager.dart';

class Overseer {
  // Generics
  Map<dynamic, dynamic> repository = {};

  //User Login type

  static String userLoginType = 'User';
  static String userLoginID = '';
  static String imageChoice = "";
  static bool userRule = false;
  static String statusCode = "";
  static String statusMessage = "";
  static int vendorOrderChoiceIndex = 0;
  static List<int> choiceVendorList = [0, 1, 2, 3];

  //TODO: inquiry form String
  static String inquiryCategoriesID = "";
  static String inquirySubCategoriesID = "";
  static List<String> inquirySubCategoriesVendorTypeIdList = [];
  static List<String> inquiryChoiceShowCaseIdList = [];
  static String inquirySelectCityName = "";
  static double latitude = 0.0;
  static double longitude = 0.0;
  static String inquiryName = "";
  static String inquiryPhoneNumber = "";
  static String inquiryEmail = "";
  static String inquiryArea = "";
  static String userInquiryDeleteId = "";

  //TODO: User Profile
  static String userProfileImage = "";
  static String userProfileEmail = "";
  static String userProfileName = "";

  //TODO: vendor Profile
  static String vendorProfileImage = "";
  static String vendorProfileEmail = "";
  static String vendorProfileFName = "";
  static String vendorProfileLName = "";

  //TODO: vendor Order
  static List<File> vendorOrderAddStepImageFile = [];
  static List<File> vendorOrderAddStepVideosFile = [];
  static List<File> vendorOrderAddStepAudioFile = [];

  //TODO: Admin Panel
  static String adminOrderDetailsIDByShowVendorType = "";
  static List<String> addAdminVendorTypesIdList = [];
  static String adminProfileImg = "";
  static String adminProfileFName = "";
  static String adminProfileLName = "";
  static String adminProfileEmail = "";
  static String adminProfilePhone = "";

  //TODO: ids
  static String mainCategoriesID = "";
  static String categoriesVendorTypeID = "";
  static String vendorListID = "";
  static String vendorListingID = "";
  static String vendorListingSubCategoriesID1 = "";
  static String vendorListingSubCategoriesID = "";

  //TODO:listing buy id and buy screen data
  // static String paymentType = "";

  //TODO:AppConstant_Url

  static String VENDOR_LISTING_URL =
      'https://s3bits.com/vendorapp/storage/app/public/product/';

  //TODO:Register Managers
  Overseer() {
// register managers
    register(LoginFormManager, LoginFormManager());
    register(SignUpFormManager, SignUpFormManager());
    register(OTPFormManager, OTPFormManager());
    register(SignOtpFormManager, SignOtpFormManager());
    register(NewPasswordFormManager, NewPasswordFormManager());
    register(ForgotFormManager, ForgotFormManager());
    register(HomeUserDictionaryManager, HomeUserDictionaryManager());
    register(SubCategoriesManager, SubCategoriesManager());
    register(VendorTypeManager, VendorTypeManager());
    register(VendorListManager, VendorListManager());
    register(UserListingManager, UserListingManager());
    register(UserShowCaseManager, UserShowCaseManager());
    register(ChoiceShowCaseManager, ChoiceShowCaseManager());
    register(UserProfileManager, UserProfileManager());
    register(VendorListingSubCategoriesIdManager,
        VendorListingSubCategoriesIdManager());
    register(ShoppingManager, ShoppingManager());
    //TODO:Vendor
    register(SubCategoriesIdBaseListingShowManager,
        SubCategoriesIdBaseListingShowManager());
    register(VendorShowCaseManager, VendorShowCaseManager());
    register(VendorProfileManager, VendorProfileManager());
    register(UserInquiryFormViewManager, UserInquiryFormViewManager());
    register(UserSurveyFormViewManager, UserSurveyFormViewManager());
    register(AdminOrderDetailsManager, AdminOrderDetailsManager());
    register(AdminVendorTypeManager, AdminVendorTypeManager());
    register(VendorOrderManager, VendorOrderManager());
    register(UserOrderManager, UserOrderManager());
    register(EcommerceOrderManager, EcommerceOrderManager());
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}
