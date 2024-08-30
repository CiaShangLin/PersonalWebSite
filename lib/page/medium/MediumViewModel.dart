import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:personal_website/data/Medium.dart';

class MediumViewModel{
  Future<Medium> getMedium() async{
    try {
      final String response = await rootBundle.loadString('assets/medium.json');
      final data = json.decode(response);
      return  Medium.fromJson(data);
    } catch (e) {
      return Future.error(e);
    }
  }
}