import 'package:dio/dio.dart';
import 'package:e_com_app/models/authenticated_user.dart';
import 'package:e_com_app/models/user.dart';
import 'package:e_com_app/services/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Dio api = Api.api();
  String? responseMessage;

  Future<String> createUser(Map<String, dynamic> data) async {
    final response = await api.post(
      'auth/register',
      data: data,
    );

    return response.data["message"];
  }

  Future<AuthenticatedUser> login(Map<String, dynamic> data) async {
    final response = await api.post('auth/login', data: data);

    return AuthenticatedUser.fromJson(response.data);
  }

  Future<User> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('userToken') ?? "";

    final options = Options(headers: {
      "Authorization": "Bearer $userToken",
    });
    final response = await api.get(
      "auth/profile",
      options: options,
    );
    return User.fromJson(response.data);
  }
}
