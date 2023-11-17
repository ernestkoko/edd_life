import 'package:edd_life/model/auth_user.dart';
import 'package:edd_life/service/app_service.dart';

abstract class AppAuthProvider{
  static final authService = IAuthService.instance;
  
  static Future<AuthUser> signInWithGoogle()async{
    return await authService.signInWithGoogle();
  }

  static Future<AuthUser> signInWithGithub()async{
    return await authService.signInWithGitHub();
  }
  
}