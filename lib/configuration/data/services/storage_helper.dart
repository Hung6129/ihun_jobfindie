import 'package:ihun_jobfindie/configuration/constants/app_storage.dart';
import 'package:ihun_jobfindie/features/authenticate/data/models/user_post_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _preferences;

  Future<StorageServices> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  get getBool => _preferences.getBool;

  String getString(String key) {
    return _preferences.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool isSavePassword() {
    return _preferences.getBool(AppStorage.isSavePassword) ?? false;
  }

  bool getIsFirstTime() {
    return _preferences.getBool(AppStorage.firstTimeOpen) == null ? true : false;
  }

  Future<bool> remove(String userToken) {
    return _preferences.remove(userToken);
  }

  void clear() {
    _preferences.clear();
  }

  void saveUserInfor(UserPostModel user) async {
    await _preferences.setString(AppStorage.userTokenKey, user.token);
    await _preferences.setString(AppStorage.userProfileKey, user.id);
    await _preferences.setString(AppStorage.refreshToken, user.refreshToken);
    await _preferences.setString(AppStorage.userEmail, user.email);
    await _preferences.setString(AppStorage.userName, user.userName);
    await _preferences.setBool(AppStorage.isAgent, user.isAgent);
  }

  void removeUserInfor() async {
    await _preferences.remove(AppStorage.userTokenKey);
    await _preferences.remove(AppStorage.userProfileKey);
    await _preferences.remove(AppStorage.refreshToken);
    await _preferences.remove(AppStorage.userEmail);
    await _preferences.remove(AppStorage.userName);
    await _preferences.remove(AppStorage.isAgent);
  }
}
