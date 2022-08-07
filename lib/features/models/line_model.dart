import 'dart:convert';
/// type : "header"
/// text : "text the line"
/// color : "red"
/// style : "style"
/// font : "arial"

LineModel lineModelFromJson(String str) => LineModel.fromJson(json.decode(str));
String lineModelToJson(LineModel data) => json.encode(data.toJson());
class LineModel {
  LineModel({
      String? type, 
      String? text, 
      String? color, 
      String? style, 
      String? font,}){
    _type = type;
    _text = text;
    _color = color;
    _style = style;
    _font = font;
}

  LineModel.fromJson(dynamic json) {
    _type = json['type'];
    _text = json['text'];
    _color = json['color'];
    _style = json['style'];
    _font = json['font'];
  }
  String? _type;
  String? _text;
  String? _color;
  String? _style;
  String? _font;

  String? get type => _type;
  String? get text => _text;
  String? get color => _color;
  String? get style => _style;
  String? get font => _font;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['text'] = _text;
    map['color'] = _color;
    map['style'] = _style;
    map['font'] = _font;
    return map;
  }

}