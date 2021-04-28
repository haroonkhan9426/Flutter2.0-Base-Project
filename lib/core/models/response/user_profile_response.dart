import 'package:f2_base_project/core/models/response/base_response.dart';
import 'package:f2_base_project/core/models/user_profile.dart';

class UserProfileResponse extends BaseResponse {
  UserProfile? userProfile;
  UserProfileResponse.fromJson(json) : super.fromJson(json) {
    this.userProfile = UserProfile.fromJson(json['body']);
  }
}
