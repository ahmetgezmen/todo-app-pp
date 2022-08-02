import 'dart:convert';
/// title : "titlesddsa"
/// list : ["SDRSERF","SDFSKDFGKS"]
/// isLiked : true

NoteFilesModel noteFilesModelFromJson(String str) => NoteFilesModel.fromJson(json.decode(str));
String noteFilesModelToJson(NoteFilesModel data) => json.encode(data.toJson());
class NoteFilesModel {
  NoteFilesModel({
      String? title, 
      List<String>? list, 
      bool? isLiked,}){
    _title = title;
    _list = list;
    _isLiked = isLiked;
}

  NoteFilesModel.fromJson(dynamic json) {
    _title = json['title'];
    _list = json['list'] != null ? json['list'].cast<String>() : [];
    _isLiked = json['isLiked'];
  }
  String? _title;
  List<String>? _list;
  bool? _isLiked;

  String? get title => _title;
  List<String>? get list => _list;
  bool? get isLiked => _isLiked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['list'] = _list;
    map['isLiked'] = _isLiked;
    return map;
  }

}