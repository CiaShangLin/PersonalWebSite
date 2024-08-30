import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LogPageState();
  }
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("開發日誌",style: Theme.of(context).textTheme.headlineLarge,),
          Text("2024/8/30\n暫時先推上Github上\n實作簡易功能跟UI有空再開發",style: Theme.of(context).textTheme.bodyMedium,)
        ],
      ),
    );
  }
}
