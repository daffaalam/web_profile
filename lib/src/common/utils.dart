import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<bool> urlLaunch(String url) async {
    bool isCanLaunch = await canLaunch(url);
    bool isLaunch = false;
    if (isCanLaunch) isLaunch = await launch(url);
    return isLaunch;
  }
}
