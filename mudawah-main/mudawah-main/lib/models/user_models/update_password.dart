import 'package:equatable/equatable.dart';

class UpdatePasswordBody {
  String? currentPassword;
  String? newPassword;
  String? newPasswordConfirmation;

  UpdatePasswordBody(
      {this.currentPassword, this.newPassword, this.newPasswordConfirmation});

  UpdatePasswordBody.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current-password'];
    newPassword = json['new-password'];
    newPasswordConfirmation = json['new-password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current-password'] = this.currentPassword;
    data['new-password'] = this.newPassword;
    data['new-password_confirmation'] = this.newPasswordConfirmation;
    return data;
  }
}
