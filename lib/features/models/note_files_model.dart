import 'dart:convert';
/// title : "titlesddsa"
/// list : ["SDRSERF","SDFSKDFGKS"]
/// isPrivate : true
NoteFilesModel noteFilesModelFromJson(String str) => NoteFilesModel.fromJson(json.decode(str));
String noteFilesModelToJson(NoteFilesModel data) => json.encode(data.toJson());
class NoteFilesModel {
  NoteFilesModel({
    String? title,
    String? uid,
    String? parentUid,
    List<String>? list,
    bool? isUnderTheMain,
    bool? isPrivate,}){
    _title = title;
    _uid = uid;
    _parentUid = parentUid;
    _list = list;
    _isPrivate = isPrivate;
    _isUnderTheMain = isUnderTheMain;
  }

  NoteFilesModel.fromJson(dynamic json) {
    _title = json['title'];
    _uid = json['uid'];
    _parentUid = json['parentUid'];
    _list = json['list'] != null ? json['list'].cast<String>() : [];
    _isPrivate = json['isPrivate'];
    _isUnderTheMain = json['isUnderTheMain'];
  }
  String? _title;
  String? _uid;
  String? _parentUid;
  List<String>? _list;
  bool? _isPrivate;
  bool? _isUnderTheMain;

  String? get title => _title;
  String? get uid => _uid;
  String? get parentUid => _parentUid;
  List<String>? get list => _list;
  bool? get isPrivate => _isPrivate;
  bool? get isUnderTheMain => _isUnderTheMain;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['uid'] = _uid;
    map['parentUid'] = _parentUid;
    map['list'] = _list;
    map['isPrivate'] = _isPrivate;
    map['isUnderTheMain'] = _isUnderTheMain;
    return map;
  }

}