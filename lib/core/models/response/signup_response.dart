import 'package:f2_base_project/core/models/response/base_response.dart';

class AuthResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  AuthResponse(succes, {error, this.accessToken}) : super(succes, error: error);

  /// Named Constructor
  AuthResponse.fromJson(json) : super.fromJson(json) {
    this.accessToken = json['body']['access_token'];
  }
}
