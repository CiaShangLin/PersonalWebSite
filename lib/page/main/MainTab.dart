import 'package:flutter/material.dart';

enum MainTab {
  RESUME(label: '個人履歷'),
  GITHUB(label: 'GitHub'),
  MEDIUM(label: 'Medium'),
  HACKMD(label: 'HackMD'),
  LOG(label: "開發日誌");

  final String label;

  const MainTab({ required this.label});
}