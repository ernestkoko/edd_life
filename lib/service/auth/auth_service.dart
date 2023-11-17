import 'dart:developer';
import 'dart:io';

import 'package:edd_life/model/auth_user.dart';
import 'package:edd_life/service/app_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService implements IAuthService {
  @override
  Future<AuthUser> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    log('Signed in');
    log('${googleUser!.email}');
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final cred = await FirebaseAuth.instance.signInWithCredential(credential);
    log('Google singedin');
    // Once signed in, return the UserCredential
    if (cred.user == null) {
      throw const HttpException("Invalid user");
    }
    final user = _getAuthUser(cred.user!);
    return user;
  }

  @override
  Future<AuthUser> signInWithGitHub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    final cred = await FirebaseAuth.instance.signInWithProvider(githubProvider);
    if (cred.user == null) {
      throw const HttpException("Invalid user");
    }
    final user = _getAuthUser(cred.user!);
    return user;
  }

  AuthUser _getAuthUser(User user) {
    final authUser = AuthUser(
      name: user.displayName ?? "",
      email: user.email ?? '',
      uuid: user.uid,
      imageUrl: user.photoURL ?? '',
    );
    return authUser;
  }

  @override
  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
