import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/Medium.dart';
import '../../ui/LoadingWidget.dart';
import 'MediumViewModel.dart';

class MediumPage extends StatefulWidget {
  const MediumPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MediumPageState();
  }
}

class _MediumPageState extends State<MediumPage> {
  late MediumViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = MediumViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: FutureBuilder<Medium>(
            future: _viewModel.getMedium(),
            builder: (BuildContext context, AsyncSnapshot<Medium> snapshot) {
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

  Widget getSuccess(Medium? data) {
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
