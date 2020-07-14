class Chemical{
  int _id;
  String _name, _volume,_price,_dose;

  Chemical(dynamic obj){
    _id = obj['id'];
    _name = obj['name'];
    _volume = obj['volume'];
    _price = obj['price'];
    _dose = obj['dose'];
  }
  Chemical.fromMap(Map<String, dynamic> data){
    _id = data['id'];
    _name = data['name'];
    _volume = data['volume'];
    _price = data['price'];
    _dose = data['dose'];
  }
  Map<String, dynamic> toMap() => {'id' : _id, 'name': _name,'volume' : _volume,'price':_price,'dose':_dose};
  int get id => _id;
  String get name => _name;
  String get volume => _volume;
  String get price => _price;
  String get dose => _dose;
}