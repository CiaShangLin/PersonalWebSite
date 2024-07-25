import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/Resume.dart';

class LinkIconWidget extends StatelessWidget {

  final Socials? social;

  const LinkIconWidget({Key? key, required this.social});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(social?.link ?? ""));
      },
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
        child: Image.network(social?.icon ?? ""),
      ),
    );
  }

}