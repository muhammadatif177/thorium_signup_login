class CustomAuthResult {
  bool? status;
  String? errorMessage;
  var user;
  bool? isEmailVerified;
  bool? isUserAlreadyRegistered;

  CustomAuthResult({this.status, this.errorMessage, this.user, this.isEmailVerified, this.isUserAlreadyRegistered = false});
}
