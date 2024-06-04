import 'package:dio/dio.dart';
import 'package:vendor_app/AppLayer/Overseer.dart';

import 'network_client.dart';

class ApiService {
  final NetworkClient networkClient;

  ApiService({required this.networkClient});

  ///############################### Post Api ###################################

  ///Register
  Future<Response> registerUser(Map<String, Object> params) {
    print('Register ############## ${DateTime.now().second}');
    return networkClient.post('api/v1/auth/register', params);
  }

  ///LogIn
  Future<Response> loginUser(Map<String, Object> params) {
    print('login method api  ${DateTime.now().second}');
    return networkClient.post('api/v1/auth/login', params);
  }

  ///############################### Get Api USER ###################################

  ///get Home User Dictionary Data
  Future<Response> getHomeUserDictionaryData() {
    return networkClient.get('api/v1/categories/main', {});
  }

  ///get user sub categories data
  Future<Response> getSubCategoriesData() {
    return networkClient
        .get('api/v1/categories/child/${Overseer.mainCategoriesID}', {});
  }

  ///get user shopping data
  Future<Response> getUserShoppingData() {
    return networkClient.get('api/v1/customer/order/customer/orders', {});
  }

  ///get user vendor type categories data
  Future<Response> getCategoriesVendorTypeData() {
    return networkClient.get(
        'api/v1/categories/vendor_type/${Overseer.categoriesVendorTypeID}', {});
  }

  ///get user vendor list data
  Future<Response> getVendorListData() {
    return networkClient
        .get('api/v1/categories/vendor/${Overseer.vendorListID}', {});
  }

  ///get vendor Listing data
  Future<Response> getUserListingData() {
    return networkClient
        .get('api/v1/products/get_listing/${Overseer.vendorListingID}', {});
  }

  ///get vendor Listing data
  Future<Response> getUserShowCaseData() {
    return networkClient
        .get('api/v1/products/get_showcase/${Overseer.vendorListingID}', {});
  }

  //TODO: ...............
  ///get User choice Showcase data
  Future<Response> getUserChoiceShowCaseData() {
    return networkClient.get(
        'api/v1/products/get_showcases_with_vendor_type_id/${Overseer.inquirySubCategoriesVendorTypeIdList}',
        {});
  }

  ///get User inquiry  data
  Future<Response> getUserInquiryData() {
    return networkClient.get('api/v1/customer/inquiry/get_inquiry_form', {});
  }

  ///get User Survey  data
  Future<Response> getUserSurveyData() {
    return networkClient.get('api/v1/customer/inquiry/get_survey_form', {});
  }

  ///get  User Profile  data
  Future<Response> getUserProfileData() {
    return networkClient.get('api/v1/customer/profile', {});
  }

  ///get delete inquiry Form  data
  Future<Response> deleteUserInquiryData() {
    return networkClient.delete(
        'api/v1/customer/inquiry/delete_inquiry/${Overseer.userInquiryDeleteId}',
        {});
  }

  ///get User order  data
  Future<Response> getUserOrderData() {
    return networkClient.get('api/v1/customer/mvorder/get_orders', {});
  }

  ///############################### Vendor Get api ###################################

  ///get vendor Sub Categories data
  Future<Response> getVendorSubCategoriesData() {
    return networkClient.get('api/v1/vendor/categories/vendor_sub-cats', {});
  }

  ///get vendor Sub  Categories id Base Listing  data
  Future<Response> getVendorSubCategoriesIdListingData() {
    return networkClient.get(
        'api/v1/vendor/product/show-with-cat-id/${Overseer.vendorListingSubCategoriesID}',
        {});
  }

//TODO: showCase api Post Convert to Get
  ///get vendor  showCase  data
  Future<Response> getVendorShowCaseData() {
    return networkClient.get('api/v1/vendor/showcase/show', {});
  }

  ///get vendor  Profile  data
  Future<Response> getVendorProfileData() {
    return networkClient.get('api/v1/vendor/profile', {});
  }

  ///get Vendor order  data
  Future<Response> getVendorOrderData() {
    return networkClient.get('api/v1/vendor/order/get_orders', {});
  }

  ///############################### Vendor Delete/post api ###################################

  ///get vendor Sub  Categories delete Showcase  data
  Future<Response> getDeleteVendorShowCaseData({required String userId}) {
    return networkClient.delete('api/v1/vendor/showcase/delete/${userId}', {});
  }

  ///get vendor Sub  Categories delete Listing  data
  Future<Response> getDeleteVendorListingData({required String userId}) {
    return networkClient.delete('api/v1/vendor/product/delete/${userId}', {});
  }

  /// post delete Listing images data
  Future<Response> postListingImagesDeleteData(Map<String, Object> params) {
    return networkClient.post("api/v1/vendor/product/del-image", params);
  }

  /// post delete ShowCase images data
  Future<Response> postShowCaseImagesDeleteData(Map<String, Object> params) {
    return networkClient.post("api/v1/vendor/showcase/del-image", params);
  }

  ///############################### Admin Get api ###################################

  ///get Admin order Details data
  Future<Response> getAdminOrderDetailsData() {
    return networkClient.get('api/v1/admin/get-orders', {});
  }

  ///get Admin Vendor Type data
  Future<Response> getAdminVendorTypeData() {
    return networkClient.get(
        'api/v1/admin/get-vendor_types/${Overseer.adminOrderDetailsIDByShowVendorType}',
        {});
  }

  ///get Vendor  ecommerce Order Service
  Future<Response> getEcommerceOrderData() {
    return networkClient
        .get("api/v1/vendor/vendor-orders/${Overseer.userLoginID}", {});
  }
}
