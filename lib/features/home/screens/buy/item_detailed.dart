import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trash_to_cash_flutter/features/home/models/item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trash_to_cash_flutter/utils/constants/style_constants.dart';

class ItemDetailed extends StatelessWidget {
  const ItemDetailed({super.key, required this.item});
  final Item item;
  List<Widget> getImages() {
    List<Widget> images = [];
    for(int i = 0; i< item.pics!.length; i++) {
      images.add(Image.network(item.pics![i], height: 300,));
    }
    return images;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body:  Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0, enableInfiniteScroll: false),
              items: item.pics?.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                            color: Colors.grey
                        ),
                        child: Image.network(i)
                    );
                  },
                );
              }).toList(),
            ),
            Text(item.title, style: StyleConstants.heading,),

          ],
        ),
    );
  }
}
