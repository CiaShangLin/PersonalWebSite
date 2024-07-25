import 'package:flutter/cupertino.dart';

class HackMDPage extends StatefulWidget {
  const HackMDPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HackMDPageState();
  }
}

class _HackMDPageState extends State<HackMDPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("HackMDPage"),
      ),
    );
  }
}
