import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource._internal();
  LocalDataSource._internal();

  factory LocalDataSource() {
    return _instance;
  }

  Future<void> saveToken(String accessToken, String refreshToken) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString('accessToken', accessToken);
    await sf.setString('refreshToken', refreshToken);
  }

  Future<String> getAccessToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('accessToken') ?? '';
  }

  Future<String> getRefreshToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString('refreshToken') ?? '';
  }

  Future<void> deleteToken() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.remove('accessToken');
    await sf.remove('refreshToken');
  }
}
