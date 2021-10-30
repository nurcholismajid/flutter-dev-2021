import 'package:bwa_chatty/theme.dart';
import 'package:flutter/material.dart';
import 'package:bwa_chatty/widgets/send_messege.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ChatInput(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Image.asset(
                    'assets/images/profile_001.png',
                    width: 55,
                    height: 55,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jakarta Fair',
                        style: titleTextStyle,
                      ),
                      SizedBox(height: 5),
                      Text('14.209 Members', style: subtitleTextStyle)
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.call, size: 20)
                ],
              ),
              SizedBox(height: 20),
              SendMessegeLeft(
                'assets/images/profile_002.png',
                'How are you guys!?',
                '01:00',
              ),
              SendMessegeLeft(
                'assets/images/profile_004.png',
                'Fine good!?',
                '01:01',
              ),
              SendMessegeRight(
                'assets/images/profile_005.png',
                'Cool awasome dudee!',
                '01:10',
              ),
              SendMessegeLeft(
                'assets/images/profile_004.png',
                'Love Them',
                '01:01',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
