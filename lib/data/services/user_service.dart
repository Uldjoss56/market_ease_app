import 'package:dio/dio.dart';
import 'package:e_com_app/data/model/authenticated_user.dart';
import 'package:e_com_app/data/services/api/api.dart';

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
    print("Hello");
    final response = await api.post('auth/login', data: data);
    print("Hello");
    print(response);

    return AuthenticatedUser.fromJson(response.data);
  }
}
