import 'package:get/get.dart';

import '../user_model_model.dart';

class UserModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return UserModel.fromJson(map);
      if (map is List)
        return map.map((item) => UserModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://randomuser.me/api/?results=10';
  }

  Future<List<dynamic>> getUserModel() async {
    final response = await get('https://randomuser.me/api/?results=10');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['results'];
    }
  }

  Future<Response<UserModel>> postUserModel(UserModel usermodel) async =>
      await post('usermodel', usermodel);
  Future<Response> deleteUserModel(int id) async =>
      await delete('usermodel/$id');
}
