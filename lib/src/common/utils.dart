import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future<bool> urlLaunch(Uri url) async {
    try {
      await launchUrl(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> urlLaunchString(String url) async {
    Uri uri = Uri.tryParse(url) ?? Uri.https('github.com', '/daffaalam');
    return urlLaunch(uri);
  }
}
