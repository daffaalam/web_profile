import 'package:flutter/services.dart';

import '../model/personal_data.dart';

/// TODO 2
/// ambil data JSON dari aset dan masukan ke dalam model yang sudah dibuat sebelumnya

class Repository {
  static Future<PersonalData> getPersonalData() async {
    String data = await rootBundle.loadString("assets/personal_data.json");
    return PersonalData.fromJson(data);
  }
}
