import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/Github.dart';

class GithubViewModel{
  Future<Github> getGithub() async{
    try {
      final String response = await rootBundle.loadString('assets/github.json');
      final data = json.decode(response);
      return  Github.fromJson(data);
    } catch (e) {
      return Future.error(e);
    }
  }
}