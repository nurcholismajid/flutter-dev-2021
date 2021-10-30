import 'package:flutter/material.dart';
import 'package:bwa_chatty/theme.dart';

class SendMessegeLeft extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String time;

  SendMessegeLeft(this.imageUrl, this.text, this.time);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              imageUrl,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: blackColor),
                    ),
                    SizedBox(height: 10),
                    Text(time, style: TextStyle(color: greyColor))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

class SendMessegeRight extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String time;

  SendMessegeRight(this.imageUrl, this.text, this.time);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      style: TextStyle(color: blackColor),
                    ),
                    SizedBox(height: 10),
                    Text(time, style: TextStyle(color: greyColor))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(width: 10),
            Image.asset(
              imageUrl,
              width: 40,
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}

class ChatInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(75),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Type message ...',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ],
      ),
    );
  }
}
