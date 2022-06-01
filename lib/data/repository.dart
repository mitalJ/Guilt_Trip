import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:guilt_app/data/local/datasources/post/post_datasource.dart';
import 'package:guilt_app/data/sharedpref/shared_preference_helper.dart';
import 'package:guilt_app/models/Auth/Update_Profile_Modal.dart';
import 'package:guilt_app/models/Auth/commonModal.dart';
import 'package:guilt_app/models/Auth/feedback_add_model.dart';
import 'package:guilt_app/models/Auth/login_modal.dart';
import 'package:guilt_app/models/Auth/oauth_modal.dart';
import 'package:guilt_app/models/Auth/otp_send.dart';
import 'package:guilt_app/models/Auth/otpvalidatemodel.dart';
import 'package:guilt_app/models/Auth/profile_modal.dart';
import 'package:guilt_app/models/Auth/signup_modal.dart';
import 'package:guilt_app/models/Business/AddBusinessRequestModel.dart';
import 'package:guilt_app/models/Event/EventDetailResponseModel.dart';
import 'package:guilt_app/models/Event/upcoming_past_event_modal.dart';
import 'package:guilt_app/models/PageModals/Event_View_Model.dart';
import 'package:guilt_app/models/PageModals/notification_list_model.dart';
import 'package:guilt_app/models/PageModals/setting_model.dart';
import 'package:guilt_app/models/post/post.dart';
import 'package:guilt_app/ui/feedback/feedback_list_model.dart';
import 'package:sembast/sembast.dart';
import '../models/Auth/otp_send.dart';
import '../models/Auth/valid_otp_model.dart';
import '../models/Event/create_event_modal.dart';
import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveUserRole(String value) =>
      _sharedPrefsHelper.saveUserRole(value);

  Future<String> get userRole => _sharedPrefsHelper.userRole;

  Future<void> saveAuthToken(String? value) =>
      _sharedPrefsHelper.saveAuthToken(value!);

  Future<String?> get authToken => _sharedPrefsHelper.authToken;

  Future<void> saveFcmToken(String? value) =>
      _sharedPrefsHelper.saveFcmToken(value!);

  Future<String?> get fcmToken => _sharedPrefsHelper.fcmToken;

  Future<void> saveRefreshToken(String? value) =>
      _sharedPrefsHelper.saveRefreshToken(value!);

  Future<String?> get refreshToken => _sharedPrefsHelper.refreshToken;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;

  // constructor
  Repository(this._postApi, this._sharedPrefsHelper, this._postDataSource);

  // Post: ---------------------------------------------------------------------
  Future getProfile(userId) async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    var token = await authToken;
    return await _postApi.getProfile(userId, token).then((profileData) {
      return profileData;
    }).catchError((error) => throw error);
  }

  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<void> saveIsFirst(bool value) => _sharedPrefsHelper.saveIsFirst(value);

  Future<bool> get isFirst => _sharedPrefsHelper.isFirst;

  Future<void> saveProfileData(GetProfileResponseModal value) =>
      _sharedPrefsHelper.saveProfileData(value);

  Future<GetProfileResponseModal> profileData() {
    return _sharedPrefsHelper.profileData.then((value) => jsonDecode(value));
  }

  // Login:---------------------------------------------------------------------
  Future<LoginModal> login(String email, String password) async {
    var fToken = await fcmToken;
    return await _postApi
        .login(email, password, fToken)
        .then((loginData) => loginData)
        .catchError((error) => throw error);
  }

  Future<OauthModal> oauth(
      String email, String firstname, String lastname) async {
    var fToken = await fcmToken;
    return await _postApi
        .oauth(email, firstname, lastname, fcmToken)
        .then((oauthData) => oauthData)
        .catchError((error) => throw error);
  }

//setting
  Future<SettingGetModal> settingGet() async {
    var token = await authToken;
    return await _postApi.settingGet(token).then((settingData) {
      return settingData;
    }).catchError((error) => throw error);
  }

//update setting
  Future<SettingGetModal> settingpost(
      SettingPostModal UpdateSettingData) async {
    return await _postApi
        .settingpost(UpdateSettingData)
        .then((settingData) => settingData)
        .catchError((error) => throw error);
  }

  // Logout:---------------------------------------------------------------------
  Future logout() async {
    var token = await authToken;
    return await _postApi
        .logout(token)
        .then((logoutData) => logoutData)
        .catchError((error) => throw error);
  }

// Common Content GET API :---------------------------------------------------------------------
  Future getAppContent(type) async {
    return await _postApi
        .getAppContent(type)
        .then((contentData) => contentData)
        .catchError((error) => throw error);
  }

  // Check Registered Users from Contacts
  Future checkContacts(contacts) async {
    var token = await authToken;
    return await _postApi
        .checkContacts(contacts, token)
        .then((placeData) => placeData)
        .catchError((error) => throw error);
  }

  Future getBusinessPlaces() async {
    var token = await authToken;
    return await _postApi
        .getBusinessPlaces(token)
        .then((placeData) => placeData)
        .catchError((error) => throw error);
  }

  Future getBusinessSpaces() async {
    var token = await authToken;
    return await _postApi
        .getBusinessSpaces(token)
        .then((placeData) => placeData)
        .catchError((error) => throw error);
  }

  // Common Content GET API :---------------------------------------------------------------------
  Future changePassword(oldPassword, newPassword) async {
    var token = await authToken;
    return await _postApi
        .changePassword(oldPassword, newPassword, token)
        .then((contentData) => contentData)
        .catchError((error) => throw error);
  }

  // Upload Chat Image :---------------------------------------------------------------------
  Future uploadChatImage(image) async {
    var token = await authToken;
    return await _postApi
        .uploadChatImage(image, token)
        .then((contentData) => contentData)
        .catchError((error) => throw error);
  }

  // OtpSend:---------------------------------------------------------------------

  Future<OtpSendModel> Send_Otp(String email) async {
    return await _postApi.Send_Otp(email)
        .then((otpSendData) => otpSendData)
        .catchError((error) => throw error);
  }

  //notification list
  Future<NotificationListModal> Notification_list() async {
    var token = await authToken;
    return await _postApi.Notification_list(token)
        .then((NotificationData) => NotificationData)
        .catchError((error) => throw error);
  }

  //feedback add

  Future<Feedback_add_Model> Feedback_add(
      String description, int eventId, String rate) async {
    var token = await authToken;
    return await _postApi.Feedback_add(description, eventId, rate, token)
        .then((feedbackAdd) => feedbackAdd)
        .catchError((error) => throw error);
  }

//eventview
  Future Event_Detail(int eventId) async {
    var token = await authToken;
    return await _postApi
        .getEventDetail(eventId, token)
        .then((EventData) => EventData)
        .catchError((error) => throw error);
  }

  //search event
  Future getSearchEvent(String searchQuery) async {
    var token = await authToken;
    return await _postApi
        .getSearchEvent(searchQuery, token)
        .then((eventListData) => eventListData)
        .catchError((error) => throw error);
  }

  Future getUserEvent(userID) async {
    var token = await authToken;
    return await _postApi
        .getUserEvent(userID, token)
        .then((placeData) => placeData)
        .catchError((error) => throw error);
  }

  //my booked event
  Future getMyBookedEvents() async {
    var token = await authToken;
    return await _postApi
        .getMyBookedEvents(token)
        .then((eventListData) => eventListData)
        .catchError((error) => throw error);
  }

  // Feedback list
  Future<FeedbackListModel> Feedback_list(int eventId) async {
    var token = await authToken;
    return await _postApi.Feedback_list(eventId, token)
        .then((Feedback_list) => Feedback_list)
        .catchError((error) => throw error);
  }

  // Valid Otp:---------------------------------------------------------------------

  Future<ValidOtpModel> Valid_Otp(String email, String otp) async {
    return await _postApi.Valid_Otp(email, otp)
        .then((otpSendData) => otpSendData)
        .catchError((error) => throw error);
  }

  //otp validate
  Future<OtpValidateModel> OtpValidate(String email, String otp) async {
    return await _postApi.OtpValidate(email, otp)
        .then((otpSendData) => otpSendData)
        .catchError((error) => throw error);
  }

//UpcomingPastEvent
  Future<UpcomingPastEventModal> getUpcomingPastEventList(
      String filterby, int page, int size) async {
    var token = await authToken;
    return await _postApi
        .getUpcomingPastEventList(filterby, page, size, token)
        .then((eventData) => eventData)
        .catchError((error) => throw error);
  }

//updateprofile
  Future<UpdateProfileResponseModal> updateprofile(
      UpdateProfileRequestModal UpdateProfileData) async {
    var token = await authToken;
    return await _postApi
        .updateprofile(UpdateProfileData, token)
        .then((profileData) => profileData)
        .catchError((error) => throw error);
  }

//addevent
  Future createEvent(
    CreateEventRequestModal eventData, successCB, errorCB
  ) async {
    var token = await authToken;
    return await _postApi
        .createEvent(eventData, token, successCB, errorCB)
        .then((addeventData) => addeventData)
        .catchError((error) => throw error);
  }

  //add business
  Future addBusiness(
      AddBusinessRequestModel businessData, successCB, errorCB) async {
    var token = await authToken;
    return await _postApi
        .addBusiness(businessData, token, successCB, errorCB)
        .then((addedBusinessData) => addedBusinessData)
        .catchError((error) => throw error);
  }

// SignUp:---------------------------------------------------------------------
  Future<SignUpResponseModal> signUp(SignUpRequestModal signUpData) async {
    return await _postApi
        .signup(signUpData)
        .then((registerData) => registerData)
        .catchError((error) => throw error);
  }
}
