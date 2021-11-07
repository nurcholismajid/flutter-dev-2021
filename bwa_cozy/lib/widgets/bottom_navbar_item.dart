import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final bool _isClicked = false;
  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({this.imageUrl = '', this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        isActive
            ? Image.asset(
                imageUrl + '_color.png',
                width: 26,
                height: 26,
              )
            : Image.asset(
                imageUrl + '.png',
                width: 26,
                height: 26,
              ),
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
