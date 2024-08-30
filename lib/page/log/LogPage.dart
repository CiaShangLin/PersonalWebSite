import 'package:flutter/cupertino.dart';

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
      child: Text("123"),
    );
  }
}
