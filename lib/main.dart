import 'package:flutter/material.dart';
import 'package:personal_website/page/hackmd/HackmdPage.dart';
import 'package:personal_website/page/main/AvatarWidget.dart';
import 'package:personal_website/page/main/HomeTabText.dart';
import 'package:personal_website/page/main/MainTab.dart';
import 'package:personal_website/page/resume/ResumePage.dart';
import 'package:personal_website/utils/ColorUtil.dart';

import 'page/resume/ResumeViewModell.dart';
import 'page/github/GithubPage.dart';
import 'page/medium/MediumPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '蔡尚霖個人網頁',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _selectIndex = 0;

  void _onTabTap(MainTab tab) {
    setState(() {
      _selectIndex = tab.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
              height: double.infinity,
              color: menu_color,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarWidget(imageUrl: "https://i.imgur.com/GGsyErT.jpg",),
                  SizedBox(height: 16,),
                  //...：展開運算符，將列表中的每個元素插入到另一個列表中。
                  ...MainTab.values.map((tab) => HomeTabText(
                    mainTab: tab,
                    isSelected: _selectIndex == tab.index,
                    onTap: _onTabTap,
                  )),
                ]
              ),
            ),
            Expanded(
              child: getPage(),
            )
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    switch (MainTab.values[_selectIndex]) {
      case MainTab.RESUME:
        return const ResumePage();
      case MainTab.GITHUB:
        return const GithubPage();
      case MainTab.MEDIUM:
        return const MediumPage();
      case MainTab.HACKMD:
        return const HackMDPage();
    }
  }
}
