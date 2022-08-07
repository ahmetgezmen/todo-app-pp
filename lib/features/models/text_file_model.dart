import 'dart:convert';
/// name : "TextFileName"
/// index : "index "
/// isPrivet : true
/// folowerNumber : 123123
/// folowersList : ["adwadwadawdwadaw"]
/// title : "header"
/// parentUid : "asdhajksda"
/// editerList : ["asdasdasd"]
/// saverNumber : 123123
/// saverList : ["sadadwadaw"]
/// category : "uhuh"
/// items : ["sadadwadaw"]

TextFileModel textFileModelFromJson(String str) => TextFileModel.fromJson(json.decode(str));
String textFileModelToJson(TextFileModel data) => json.encode(data.toJson());
class TextFileModel {
  TextFileModel({
      String? name, 
      String? index, 
      bool? isPrivet, 
      int? folowerNumber, 
      List<String>? folowersList, 
      String? title, 
      String? parentUid, 
      List<String>? editerList, 
      int? saverNumber, 
      List<String>? saverList, 
      String? category, 
      List<String>? items,}){
    _name = name;
    _index = index;
    _isPrivet = isPrivet;
    _folowerNumber = folowerNumber;
    _folowersList = folowersList;
    _title = title;
    _parentUid = parentUid;
    _editerList = editerList;
    _saverNumber = saverNumber;
    _saverList = saverList;
    _category = category;
    _items = items;
}

  TextFileModel.fromJson(dynamic json) {
    _name = json['name'];
    _index = json['index'];
    _isPrivet = json['isPrivet'];
    _folowerNumber = json['folowerNumber'];
    _folowersList = json['folowersList'] != null ? json['folowersList'].cast<String>() : [];
    _title = json['title'];
    _parentUid = json['parentUid'];
    _editerList = json['editerList'] != null ? json['editerList'].cast<String>() : [];
    _saverNumber = json['saverNumber'];
    _saverList = json['saverList'] != null ? json['saverList'].cast<String>() : [];
    _category = json['category'];
    _items = json['items'] != null ? json['items'].cast<String>() : [];
  }
  String? _name;
  String? _index;
  bool? _isPrivet;
  int? _folowerNumber;
  List<String>? _folowersList;
  String? _title;
  String? _parentUid;
  List<String>? _editerList;
  int? _saverNumber;
  List<String>? _saverList;
  String? _category;
  List<String>? _items;

  String? get name => _name;
  String? get index => _index;
  bool? get isPrivet => _isPrivet;
  int? get folowerNumber => _folowerNumber;
  List<String>? get folowersList => _folowersList;
  String? get title => _title;
  String? get parentUid => _parentUid;
  List<String>? get editerList => _editerList;
  int? get saverNumber => _saverNumber;
  List<String>? get saverList => _saverList;
  String? get category => _category;
  List<String>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['index'] = _index;
    map['isPrivet'] = _isPrivet;
    map['folowerNumber'] = _folowerNumber;
    map['folowersList'] = _folowersList;
    map['title'] = _title;
    map['parentUid'] = _parentUid;
    map['editerList'] = _editerList;
    map['saverNumber'] = _saverNumber;
    map['saverList'] = _saverList;
    map['category'] = _category;
    map['items'] = _items;
    return map;
  }

}