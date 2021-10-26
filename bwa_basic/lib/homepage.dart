import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/bg_image.jpg'),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pantai Teluk Penyu',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Cilacap, Jawa Tengah',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.purple,
                        ),
                        SizedBox(width: 5),
                        Text('4.2')
                      ],
                    )
                  ],
                ),
              ),
              // ICON ROUTE SHARE AND CALL
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.call, size: 18),
                        SizedBox(height: 5),
                        Text('CALL', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.alt_route, size: 18),
                        SizedBox(height: 5),
                        Text('ROUTE', style: TextStyle(fontSize: 12))
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.share, size: 18),
                        SizedBox(height: 5),
                        Text('SHARE', style: TextStyle(fontSize: 12))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "Pantai Teluk Penyu merupakan salah obyek wisata yang paling dikenal di Cilacap,  Jawa Tengah. Selain didukung dengan panorama yang indah, Teluk Penyu juga berad di kawasan wisata utama di Cilacap, bersebelahan dengan Benteng Pendem dan Pulau Nusakambangan. Benteng Pendem sendiri merupakan bekas markas pertahanan tentara Belanda, sedangkan Pulau Nusakambangn dikenal sebagai ‘pulau penjara’. Nusakambangan bisa kita kunjungi menggunakan perahu yang disewakan para nelayan disekitar pantai tersebut. \n\nDibalik namanya, Pantai Teluk Penyu memang memiliki sejarahnya sendiri. Menurut cerita masyarakat setempat dulunya di Pantai Teluk Penyu ini banyak terdapat penyu yang hidup dan berkembang biak. Namun kini penyu-penyu tersebut berimigrasi ke Bali dan Lombok karena padatnya lalu lintas kapal-kapal milik Pertamina.",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
