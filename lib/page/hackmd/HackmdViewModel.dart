import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/Hackmd.dart';

class HackmdViewModel {
  Future<Hackmd> getHackmd() async {
    try {
      final String response = await rootBundle.loadString('assets/hackmd.json');
      final data = json.decode(response);
      return Hackmd.fromJson(data);
    } catch (e) {
      return Future.error(e);
    }
  }
}
