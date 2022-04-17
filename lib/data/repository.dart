import 'dart:async';
import 'dart:core';
import 'package:guilt_app/data/local/datasources/post/post_datasource.dart';
import 'package:guilt_app/data/sharedpref/shared_preference_helper.dart';
import 'package:guilt_app/models/Auth/Update_Profile_Modal.dart';
import 'package:guilt_app/models/Auth/feedback_add_model.dart';
import 'package:guilt_app/models/Auth/login_modal.dart';
import 'package:guilt_app/models/Auth/oauth_modal.dart';
import 'package:guilt_app/models/Auth/otp_send.dart';
import 'package:guilt_app/models/Auth/logoutModal.dart';
import 'package:guilt_app/models/Auth/otpvalidatemodel.dart';
import 'package:guilt_app/models/Auth/profile_modal.dart';
import 'package:guilt_app/models/Auth/signup_modal.dart';
import 'package:guilt_app/models/Event/upcoming_past_event_modal.dart';
import 'package:guilt_app/models/post/post.dart';
import 'package:sembast/sembast.dart';
import '../models/Auth/otp_send.dart';
import '../models/Auth/valid_otp_model.dart';
import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._postApi, this._sharedPrefsHelper, this._postDataSource);

  // Post: ---------------------------------------------------------------------
  Future<GetProfileResponseModal> getProfile() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    var token = await authToken;
    return await _postApi.getProfile(token).then((profileData) {
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

  Future<Object?> get profileData => _sharedPrefsHelper.profileData;

  // Login:---------------------------------------------------------------------
  Future<LoginModal> login(String email, String password) async {
    return await _postApi
        .login(email, password)
        .then((loginData) => loginData)
        .catchError((error) => throw error);
  }

  Future<OauthModal> oauth(
      String email, String firstname, String lastname) async {
    return await _postApi
        .oauth(email, firstname, lastname)
        .then((oauthData) => oauthData)
        .catchError((error) => throw error);
  }

  // Logout:---------------------------------------------------------------------
  Future<LogOutModal> logout() async {
    return await _postApi
        .logout()
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

  // OtpSend:---------------------------------------------------------------------

  Future<OtpSendModel> Send_Otp(String email) async {
    return await _postApi.Send_Otp(email)
        .then((otpSendData) => otpSendData)
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

  // Feedback list
  Future<Feedback_add_Model> Feedback_list(
      String description, int eventId, String rate) async {
    var token = await authToken;
    return await _postApi.Feedback_list(description, eventId, rate, token)
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
  Future<UpdateProfileResponseModal> updateprofile(UpdateProfileRequestModal UpdateProfileData) async {
    return await _postApi
        .updateprofile(UpdateProfileData)
        .then((profileData) => profileData)
        .catchError((error) => throw error);
  }

// SignUp:---------------------------------------------------------------------
  Future<SignUpResponseModal> signUp(SignUpRequestModal signUpData) async {
    return await _postApi
        .signup(signUpData)
        .then((registerData) => registerData)
        .catchError((error) => throw error);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveAuthToken(String? value) =>
      _sharedPrefsHelper.saveAuthToken(value!);

  Future<String?> get authToken => _sharedPrefsHelper.authToken;

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
}
