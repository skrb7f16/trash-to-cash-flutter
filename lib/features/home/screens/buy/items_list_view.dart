import 'package:flutter/material.dart';

class ItemsListView extends StatelessWidget {
  ItemsListView({super.key, required this.posts});
  final List<Widget> posts;
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 600,
        child: Scrollbar(
          thumbVisibility: false,
          controller: scrollController,
          child: ListView(
            children: posts,
            controller: scrollController,
          ),
            ),
      );
  }
}
