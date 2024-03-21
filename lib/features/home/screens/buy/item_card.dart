import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/home/screens/buy/item_detailed.dart';
import 'package:trash_to_cash_flutter/utils/constants/image_paths.dart';
import 'package:trash_to_cash_flutter/utils/constants/style_constants.dart';

import '../../models/item.dart';


class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});
  final Item item;
  void showDetailed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ItemDetailed(item: item)));
  }
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (PointerDownEvent event){showDetailed(context);},
      child: Container(
        margin: const EdgeInsets.all(10),
        child: DecoratedBox(
          decoration: StyleConstants.boxShadow,
          child: SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width-20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(item.title.toString(), style: StyleConstants.subheading),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children : [
                      Image.network(item.pics!.first.toString(), height: 300),


                    ]

                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
