
import 'package:logger/logger.dart';

class MyLogger{
  // 私有構造函數
  MyLogger._();

  // 單例實例
  static final MyLogger _instance = MyLogger._();

  // 獲取實例的工廠方法
  static MyLogger get instance => _instance;

  // Logger 實例
  final Logger _logger = Logger();

  // 公開的日誌方法
  void d(dynamic message) => _logger.d(message);
  void i(dynamic message) => _logger.i(message);
  void w(dynamic message) => _logger.w(message);
  void e(dynamic message) => _logger.e(message);
}