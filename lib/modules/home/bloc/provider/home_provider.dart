import 'package:edd_life/service/app_service.dart';

abstract class HomeProvider {
  static Future logout() async {
    await IAuthService.instance.logout();
  }
}
