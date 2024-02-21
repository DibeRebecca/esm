import 'package:esm/core/utils/api_response.dart';
import 'package:dio/dio.dart';
final dio = Dio();
class AuthRemoteDatasource {


  Future<APIresponse> register(
      {required String name,
      required String email,
      required String phone}) async {
    final data = {"name": name, "email": email, "phone": phone};

    try {
      final response = await dio.post(
        'https://www.app.loryshare.com/api/register',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
          },
          contentType: 'application/x-www-form-urlencoded',
          followRedirects: true,
        ),
      );
      print(response.statusCode);
      final jsonData = response.data;
      if (response.statusCode == 200) {
        return APIresponse(
            data: jsonData['user'],
            succes: true,
            token: jsonData['access_token']);
      } else {
        return APIresponse(
          data: response.data,
          succes: false,
          erreur: jsonData['message'],
        );
      }
    } catch (e) {
      print(e);
      return APIresponse(succes: false, erreur: "erreur");
    }
  }


  Future<APIresponse> login(
      {required String email,
        required String phone}) async {
    final data = {"email": email, "phone": phone};

    try {
      final response = await dio.post(
        'https://www.app.loryshare.com/api/login',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Accept': 'application/json',
          },
          contentType: 'application/x-www-form-urlencoded',
          followRedirects: true,
        ),
      );
print(response.statusCode);
      final jsonData = response.data;
      if (response.statusCode == 200) {
        return APIresponse(
            data: jsonData['user'],
            succes: true,
            token: jsonData['access_token']);
      } else {
        return APIresponse(
          data: response.data,
          succes: false,
          erreur: jsonData['message'],
        );
      }
    } catch (e) {
      print(e);
      return APIresponse(succes: false, erreur: "erreur");
    }
  }
}
