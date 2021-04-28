import 'package:dio/dio.dart';
import 'package:f2_base_project/core/constants/api_end_points.dart';
import 'package:f2_base_project/core/models/exceptions/response_exception.dart';
import 'package:f2_base_project/core/models/response/user_profile_response.dart';
import 'api_services.dart';

class DatabaseService {
  Future<UserProfileResponse> getUserProfile() async {
    late UserProfileResponse userProfileResponse;
    Dio dio = ApiServices().launch();

    final response =
        await dio.get('${EndPoints.baseUrl}${EndPoints.userProfile}');

    ///
    /// Status code = 200 means the request was successfull and return the data
    /// otherwise throw an exception which must be caught at the other end
    /// from where this class method is triggered
    ///
    if (response.statusCode == 200) {
      userProfileResponse = UserProfileResponse.fromJson(response.data);
      return userProfileResponse;
    } else {
      throw ResponseException('Network request failed');
    }
  }
}
