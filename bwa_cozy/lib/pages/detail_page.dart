import 'package:bwa_cozy/models/facilities_model.dart';
import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/facilities_card.dart';
import 'package:bwa_cozy/pages/error_page.dart';
import 'package:bwa_cozy/widgets/photo_card.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Space space;

  DetailPage(this.space);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    // LAUNCHER
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // throw 'Could not connect ${url}';
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    // SHOW CONFIRMATION EXAMPLE
    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah kamu yakin ingin menghubungi pemilik kos?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.space.phone}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NOTE: TITLE AND STAR
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // RATING ITEM
                            Row(
                              // LOOPING IN FLUTTER GUNAKAN MAP
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: RatingItem(index, widget.space.rating),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE: MAIN FACILITIES
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // COLUMN 1: FACILITIES ONE
                            MainFacilities(
                              Facilities(
                                  imageUrl: 'assets/kitchen.png',
                                  name: 'Kitchen',
                                  amount: widget.space.numberOfKitchens),
                            ),
                            // COLUMN 1: FACILITIES ONE
                            MainFacilities(
                              Facilities(
                                  imageUrl: 'assets/bedroom.png',
                                  name: 'Bedroom',
                                  amount: widget.space.numberOfBedrooms),
                            ),
                            // COLUMN 1: FACILITIES ONE
                            MainFacilities(
                              Facilities(
                                  imageUrl: 'assets/cupboard.png',
                                  name: 'Cupboard',
                                  amount: widget.space.numberOfCupboards),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE: PHOTO ITEM
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                          ),
                          // LOOPING IN FLUTTER
                          child: new Row(
                            children: widget.space.photos
                                .map((item) => Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: new PhotoCard(imageUrl: item),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      // NOTE: LOCATION
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${widget.space.address}\n${widget.space.city}',
                              style: regularTextStyle.copyWith(
                                fontSize: 14,
                                color: greyColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(widget.space.mapUrl);
                              },
                              child: Icon(
                                Icons.location_on_sharp,
                                color: greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      // NOTE: BOOK NOW BOTTOM
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Container(
                          width: MediaQuery.of(context).size.width - (2 * 24),
                          height: 50,
                          child: RaisedButton(
                            onPressed: () {
                              showConfirmation();
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            color: purpleColor,
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  // CLICKED OR NOT
                  InkWell(
                    onTap: () {
                      setState(() {
                        isClicked = !isClicked;
                      });
                    },
                    child: Image.asset(
                      isClicked
                          ? 'assets/btn_wishlist_color.png'
                          : 'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
