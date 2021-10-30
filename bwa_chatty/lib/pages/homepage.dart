import 'package:flutter/material.dart';
import 'package:bwa_chatty/theme.dart';
import 'package:bwa_chatty/widgets/chat_tile.dart';
import 'package:bwa_chatty/widgets/group_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: greenColor,
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset(
                'assets/images/profile_001.png',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),
              Text(
                'Nurcholis Majid',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: whiteColor),
              ),
              SizedBox(height: 2),
              Text(
                'CTF Traveller',
                style: TextStyle(color: lightBlueColor, fontSize: 16),
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friends',
                        style: titleTextStyle,
                      ),
                      ChatTile(
                        'assets/images/profile_002.png',
                        'Michael Mirachel',
                        'Sorry about yesterday',
                        'NOW',
                        true,
                      ),
                      ChatTile(
                        'assets/images/profile_003.png',
                        'Jhon Well Soon',
                        'How do you do',
                        '2:30',
                        false,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Group',
                        style: titleTextStyle,
                      ),
                      GroupTile(
                        'assets/images/profile_004.png',
                        'UTY Research',
                        'How\'s going..',
                        '13:00',
                        true,
                      ),
                      GroupTile(
                        'assets/images/profile_005.png',
                        'AI Developer',
                        'Tomorrow at 24:00',
                        '09:00',
                        true,
                      ),
                      GroupTile(
                        'assets/images/profile_005.png',
                        'Bug Bounty Hunter',
                        'Don\'t forget Devcon',
                        '02:00',
                        true,
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
