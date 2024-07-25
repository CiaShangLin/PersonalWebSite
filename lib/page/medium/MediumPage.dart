import 'package:flutter/cupertino.dart';

class MediumPage extends StatefulWidget {
  const MediumPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MediumPageState();
  }
}

class _MediumPageState extends State<MediumPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("MediumPage"),
      ),
    );
  }
}
