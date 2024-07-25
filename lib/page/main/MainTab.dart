import 'package:flutter/material.dart';

enum MainTab {
  RESUME(label: '個人履歷'),
  GITHUB(label: 'GitHub'),
  MEDIUM(label: 'Medium'),
  HACKMD(label: 'HackMD');
  // DIARY(label: 'Diary');

  final String label;

  const MainTab({ required this.label});
}