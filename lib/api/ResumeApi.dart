

import 'package:dio/dio.dart';

import '../data/Resume.dart';
import 'ApiService.dart';

class ResumeApi{
  ResumeApi._();

  static final ResumeApi _instance = ResumeApi._();

  static ResumeApi get instance => _instance;


  final _apiService = ApiService.instance;

  // 獲取簡歷的方法
  Future<Resume> getResume() async {
    try {
      Response response=await _apiService.get("get_resume");
      return Resume.fromJson(response.data);
    } catch (e) {
      // 重新拋出異常,或者您可以在這裡處理錯誤
      rethrow;
    }
  }

}