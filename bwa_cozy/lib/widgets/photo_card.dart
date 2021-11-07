import 'package:flutter/material.dart';
import 'package:bwa_cozy/models/space_model.dart';

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  PhotoCard({this.imageUrl = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 88,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
    );
  }
}
