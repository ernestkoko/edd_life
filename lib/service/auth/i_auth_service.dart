import 'package:edd_life/model/auth_user.dart';
import 'package:edd_life/service/auth/auth_service.dart';

abstract class IAuthService {
  static final IAuthService _instance = AuthService();

  static IAuthService get instance => _instance;

  Future<AuthUser> signInWithGitHub() async {
    throw UnimplementedError("signInWithGitHub not implemented yet!");
  }
  Future<AuthUser> signInWithGoogle() async {
    throw UnimplementedError("signInWithGoogle not implemented yet!");
  }

  Future logout() async {
    throw UnimplementedError("logout not implemented yet!");
  }
}
