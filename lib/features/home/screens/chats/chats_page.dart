import 'package:flutter/cupertino.dart';
class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key, required GlobalKey<State<StatefulWidget>> navigatorKey});

  @override
  State<StatefulWidget> createState() {
    return _ChatsPage();
  }

}
class _ChatsPage extends State<ChatsPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text("Your Chats")
        ],
      ),
    );
  }
}
