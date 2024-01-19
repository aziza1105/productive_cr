import 'package:firebase_auth/firebase_auth.dart';
import 'package:productive_cr/features/authentication/domain/entity/authenticated_user.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity{

  const AuthenticatedUserModel({required super.email});

  
  factory AuthenticatedUserModel.fromFirebaseUser(User user){
    return AuthenticatedUserModel(email: user.email ?? '');
  }


  Map<String, dynamic> toFirebaseUser() {
    return {
      'email': email,
      'avatar': avatar,
    };
  }
}
