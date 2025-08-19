import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatefulWidget {
  const PostVideoButton({super.key});

  @override
  State<PostVideoButton> createState() => _PostVideoButtonState();
}

class _PostVideoButtonState extends State<PostVideoButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              color: Color(0xff61d4f0),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
          ),
        ),
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.size6),
          ),
          child: Center(
            child: FaIcon(FontAwesomeIcons.plus, color: Colors.black, size: 18),
          ),
        ),
      ],
    );
  }
}
