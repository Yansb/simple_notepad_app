import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String? name;
  final String email;
  final String id;
  final String? photoUrl;

  UserModel({
    this.name,
    required this.email,
    required this.id,
    this.photoUrl,
  });

  factory UserModel.google(GoogleSignInAccount account) {
    return UserModel(
      email: account.email,
      id: account.id,
      name: account.displayName,
      photoUrl: account.photoUrl,
    );
  }
}
