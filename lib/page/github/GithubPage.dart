import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/data/Medium.dart';
import 'package:personal_website/page/github/GithubViewModel.dart';
import 'package:personal_website/page/medium/MediumViewModel.dart';

import '../../data/Github.dart';
import '../../ui/LoadingWidget.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GithubPageState();
  }
}

class _GithubPageState extends State<GithubPage> {

  late GithubViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = GithubViewModel();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: FutureBuilder<Github>(
            future: _viewModel.getGithub(),
            builder: (BuildContext context, AsyncSnapshot<Github> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingWidget();
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Icon(Icons.error);
              } else {
                return getSuccess(snapshot.data);
              }
            },
          ),
        ));
  }

  Widget getSuccess(Github? data) {
    return GridView.builder(
      itemCount: data?.data?.length ?? 0,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.0,
        crossAxisSpacing: 4.0, // 可選: 添加橫向間距
        mainAxisSpacing: 4.0,  // 可選: 添加縱向間距
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black, // 邊框顏色
              width: 1.0,         // 邊框寬度
            ),
            borderRadius: BorderRadius.circular(8.0), // 可選: 邊框圓角
          ),
          padding: EdgeInsets.all(8.0), // 可選: 內邊距
          child: Center(
            child: Text(
              "${data?.data?[index].name}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
