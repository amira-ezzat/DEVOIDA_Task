class Auth {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  Auth({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory Auth.fromMap(Map<String, dynamic> data, String documentId) {
    return Auth(
      id: documentId,
      fullName: data['fullName'] ?? '',
      email: data['email'] ?? '',
      password: data['password'] ?? '',
      confirmPassword: data['confirmPassword'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}
