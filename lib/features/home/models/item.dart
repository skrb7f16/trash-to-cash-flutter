
class Item {
  String? address;
  String? at;
  String? by;
  String? byId;
  String? city;
  String? desc;
  bool? donate;
  String? id;
  List<String>? pics;
  double? price;
  bool? taken;
  String title = '';
  String? type;

  Item(
      {this.address,
        this.at,
        this.by,
        this.byId,
        this.city,
        this.desc,
        this.donate,
        this.id,
        this.pics,
        this.price,
        this.taken,
        required this.title,
        this.type});

  Item.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    at = json['at'];
    by = json['by'];
    byId = json['byId'];
    city = json['city'];
    desc = json['desc'];
    donate = json['donate'];
    id = json['id'];
    pics = json['pics'].cast<String>();
    price = double.tryParse(json['price'].toString());
    taken = json['taken'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['at'] = at;
    data['by'] = by;
    data['byId'] = byId;
    data['city'] = city;
    data['desc'] = desc;
    data['donate'] = donate;
    data['id'] = id;
    data['pics'] = pics;
    data['price'] = price;
    data['taken'] = taken;
    data['title'] = title;
    data['type'] = type;
    return data;
  }


}
