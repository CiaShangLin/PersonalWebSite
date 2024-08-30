import 'package:flutter/cupertino.dart';
import 'package:personal_website/data/Medium.dart';
import 'package:personal_website/page/medium/MediumViewModel.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GithubPageState();
  }
}

class _GithubPageState extends State<GithubPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Github"),
      ),
    );
  }
}
