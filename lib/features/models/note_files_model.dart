import 'dart:convert';
/// title : "titlesddsa"
/// list : ["SDRSERF","SDFSKDFGKS"]
/// isPrivate : true

NoteFilesModel noteFilesModelFromJson(String str) => NoteFilesModel.fromJson(json.decode(str));
String noteFilesModelToJson(NoteFilesModel data) => json.encode(data.toJson());
class NoteFilesModel {
  NoteFilesModel({
      String? title, 
      List<String>? list, 
      bool? isPrivate,}){
    _title = title;
    _list = list;
    _isPrivate = isPrivate;
}

  NoteFilesModel.fromJson(dynamic json) {
    _title = json['title'];
    _list = json['list'] != null ? json['list'].cast<String>() : [];
    _isPrivate = json['isPrivate'];
  }
  String? _title;
  List<String>? _list;
  bool? _isPrivate;

  String? get title => _title;
  List<String>? get list => _list;
  bool? get isPrivate => _isPrivate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['list'] = _list;
    map['isPrivate'] = _isPrivate;
    return map;
  }

}