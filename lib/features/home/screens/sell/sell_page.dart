import 'package:flutter/material.dart';
import 'package:trash_to_cash_flutter/utils/constants/style_constants.dart';

import '../../../../utils/constants/text_constants.dart';

class SellPage extends StatefulWidget{
  const SellPage({super.key, required this.navigatorKey});

  final GlobalKey navigatorKey;
  @override
  State<StatefulWidget> createState() => _SellPage();
}

class _SellPage extends State<SellPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priceController  =TextEditingController();
  bool loading= false;

  void submit() {

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height - 30,
        margin: const EdgeInsets.all(20),


        child: DecoratedBox(
          decoration: const BoxDecoration(boxShadow: [BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )], borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: !loading ? Column(
              children: [
                const Text(TextConstants.sellPageHeading, style: StyleConstants.heading,),
                TextFormField(style: TextStyle(color: Colors.black),decoration: InputDecoration(hintText: TextConstants.sellPagePlaceholders["title"]), controller: titleController,),
                TextFormField(decoration:  InputDecoration(hintText: TextConstants.sellPagePlaceholders["city"]), controller: cityController,),
                TextFormField(decoration:  InputDecoration(hintText: TextConstants.sellPagePlaceholders["price"]), controller: priceController,),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(hintText: TextConstants.sellPagePlaceholders["desc"]),
                  controller: descController,
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed:submit , style: StyleConstants.primaryButton, child: const Text('Submit'),),
                const SizedBox(height: 10,),

              ],
            ): Text("Loggin in.."),
          ),
        ),
      ),
    );
  }
}
