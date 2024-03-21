import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/features/home/models/item.dart';
import 'package:trash_to_cash_flutter/features/home/screens/buy/item_card.dart';
import 'package:trash_to_cash_flutter/features/home/screens/buy/items_list_view.dart';
import 'package:trash_to_cash_flutter/utils/constants/style_constants.dart';

class BuyPage extends StatefulWidget {
  BuyPage({required this.navigatorKey});
  final GlobalKey navigatorKey;
  @override
  State<StatefulWidget> createState() {
    return _BuyPage();

  }
}

class _BuyPage extends State<BuyPage> {
  List<Widget> posts = [];
  @override
  void initState() {
    super.initState();
    getAllPosts();
  }
  void getAllPosts()  {
    FirebaseDatabase.instance.ref('feeds').onValue.listen((event) {
      List<Widget> tempPosts=[];
      for (var element in event.snapshot.children) {

          tempPosts.add(ItemCard(item: Item.fromJson(element.value as Map<String, dynamic>)));

      }
      setState(() {
        posts = tempPosts;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
            builder: (BuildContext context){
              return Scaffold(
                body: posts.isNotEmpty?Column(
                  children: [
                    const SizedBox(
                        height: 100,
                        child: Center(child: Text("Recent Items for sale", style: StyleConstants.heading,))),
                    ItemsListView(posts: posts)
                  ],

                ):const Text("LOADING..."),
              );
            },

        );
      }

    );
  }
}
