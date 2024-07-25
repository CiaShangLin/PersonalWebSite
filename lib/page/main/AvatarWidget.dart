import 'package:flutter/cupertino.dart';

import '../../utils/ColorUtil.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;

  const AvatarWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: avatar_color, width: 6)),
      child: ClipOval(
        child: Image.network(
          imageUrl,
        ),
      ),
    );
  }
}
