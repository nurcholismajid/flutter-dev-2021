import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/models/tips_model.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  Tips tips;

  TipsCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              'Updated ${tips.date}',
              style: greyTextStyle.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_outlined,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
