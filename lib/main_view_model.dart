

import 'dart:convert';

import 'package:flutter/services.dart';

import 'data/Resume.dart';

class MainViewModel{

  Future<Resume> getResume() async{
    try {
      // 讀取assets中的JSON文件
      final String response = await rootBundle.loadString('assets/local_resume.json');

      // 將讀取的字符串解析為JSON
      final data = json.decode(response);
      final resume  = Resume.fromJson(data);

      return Future.value(resume);
    } catch (e) {
      return Future.error(e);
    }
  }
}