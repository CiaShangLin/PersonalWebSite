

import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data/Resume.dart';

class ResumeViewModel{

  Future<Resume> getResume() async{
    try {
      final String response = await rootBundle.loadString('assets/local_resume.json');
      final data = json.decode(response);
      return  Resume.fromJson(data);
    } catch (e) {
      return Future.error(e);
    }
  }
}