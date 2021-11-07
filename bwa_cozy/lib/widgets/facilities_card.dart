import 'package:flutter/material.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/models/facilities_model.dart';

class MainFacilities extends StatelessWidget {
  final Facilities facilities;

  MainFacilities(this.facilities);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          facilities.imageUrl,
          width: 32,
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: facilities.amount.toString(),
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: ' ${facilities.name}',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
