import 'package:bwa_cozy/models/city_model.dart';
import 'package:bwa_cozy/models/space_model.dart';
import 'package:bwa_cozy/models/tips_model.dart';
import 'package:bwa_cozy/providers/space_provider.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/city_card.dart';
import 'package:bwa_cozy/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy/widgets/space_card.dart';
import 'package:bwa_cozy/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // LETAKAN PROVIDER PADA PAGE YANG INGIN MENGGUNAKAN API NYA
    // DISINI YAITU HOMEPAGE, BUAT OBJEK PROVIDER SEPERTI DIBAWAH INI
    var spaceProvider = Provider.of<SpaceProvider>(context);
    // panggil objek

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            // NOTE: LIST VIEW CARD POPULAR CITY
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                        isPopular: false,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                        isPopular: false,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/city4.png',
                        isPopular: false,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 5,
                        name: 'Aceh',
                        imageUrl: 'assets/city5.png',
                        isPopular: true,
                      ),
                    ),
                    SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/city6.png',
                        isPopular: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: RECOMENDED SPACE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: FutureBuilder(
                  future: spaceProvider.getRecommendedSpaces(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // KONDISI UNTUK MENAMPILKAN DATA DARI API
                      List data = snapshot.data as List;
                      int index = 0;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: data.map((item) {
                          index++;
                          return Container(
                            margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                            child: SpaceCard(item),
                          );
                        }).toList(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            // NOTE: TIPS & GUIDENCE
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        name: 'City Guidelines',
                        date: '20 Apr',
                        imageUrl: 'assets/tips1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                        id: 2,
                        name: 'Jakarta Fairship',
                        date: '11 Dec',
                        imageUrl: 'assets/tips2.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + 40,
            ),
          ],
        ),
      ),
      // NOTE: FLOATING BUTTON
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * 24),
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/Icon_home_solid',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_mail_solid',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_card_solid',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/Icon_love_solid',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
