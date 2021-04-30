class SignUpBody {
  String? email;
  String? password;

  /// Other fields to be added as well.

  SignUpBody({this.email, this.password});

  toJson() => {
        'email': this.email,
        'password': this.password,
      };
}
