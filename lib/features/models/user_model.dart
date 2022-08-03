import 'dart:convert';
/// isAktive : true
/// isApproved : true
/// favList : ["ndajsdfa"]
/// myNotes : ["sdasdas"]
/// myFriends : ["sdjnfs"]
/// gender : "male"
/// fname : "Mark Spector"
/// location : {"street":"9278 new road","city":"kilcoole","state":"waterford","postcode":"93027"}
/// email : "brad.gibson@example.com"
/// uuid : "155e77ee-ba6d-486f-95ce-0e0c0fb4b919"
/// username : "silverswan131"
/// password : "firewall"
/// dob : {"date":"1993-07-20T09:44:18.674Z","age":26}
/// registered : {"date":"2002-05-21T10:59:49.966Z","age":17}
/// schools : {"name":"name uni","faculty":"Med","classNumber":3}
/// phone : "011-962-7516"

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      bool? isAktive, 
      bool? isApproved, 
      List<String>? favList, 
      List<String>? myNotes, 
      List<String>? myFriends, 
      String? gender, 
      String? fname, 
      String? picsUrl,
      Location? location,
      String? email, 
      String? uuid, 
      String? username, 
      String? password, 
      Dob? dob, 
      Registered? registered, 
      Schools? schools, 
      String? phone,}){
    _isAktive = isAktive;
    _isApproved = isApproved;
    _favList = favList;
    _myNotes = myNotes;
    _myFriends = myFriends;
    _gender = gender;
    _fname = fname;
    _picsUrl = picsUrl;
    _location = location;
    _email = email;
    _uuid = uuid;
    _username = username;
    _password = password;
    _dob = dob;
    _registered = registered;
    _schools = schools;
    _phone = phone;
}

  UserModel.fromJson(dynamic json) {
    _isAktive = json['isAktive'];
    _isApproved = json['isApproved'];
    _favList = json['favList'] != null ? json['favList'].cast<String>() : [];
    _myNotes = json['myNotes'] != null ? json['myNotes'].cast<String>() : [];
    _myFriends = json['myFriends'] != null ? json['myFriends'].cast<String>() : [];
    _gender = json['gender'];
    _fname = json['fname'];
    _picsUrl = json['picsUrl'];
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
    _email = json['email'];
    _uuid = json['uuid'];
    _username = json['username'];
    _password = json['password'];
    _dob = json['dob'] != null ? Dob.fromJson(json['dob']) : null;
    _registered = json['registered'] != null ? Registered.fromJson(json['registered']) : null;
    _schools = json['schools'] != null ? Schools.fromJson(json['schools']) : null;
    _phone = json['phone'];
  }
  bool? _isAktive;
  bool? _isApproved;
  List<String>? _favList;
  List<String>? _myNotes;
  List<String>? _myFriends;
  String? _gender;
  String? _fname;
  String? _picsUrl;
  Location? _location;
  String? _email;
  String? _uuid;
  String? _username;
  String? _password;
  Dob? _dob;
  Registered? _registered;
  Schools? _schools;
  String? _phone;

  bool? get isAktive => _isAktive;
  bool? get isApproved => _isApproved;
  List<String>? get favList => _favList;
  List<String>? get myNotes => _myNotes;
  List<String>? get myFriends => _myFriends;
  String? get gender => _gender;
  String? get fname => _fname;
  String? get picsUrl => _picsUrl;
  Location? get location => _location;
  String? get email => _email;
  String? get uuid => _uuid;
  String? get username => _username;
  String? get password => _password;
  Dob? get dob => _dob;
  Registered? get registered => _registered;
  Schools? get schools => _schools;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isAktive'] = _isAktive;
    map['isApproved'] = _isApproved;
    map['favList'] = _favList;
    map['myNotes'] = _myNotes;
    map['myFriends'] = _myFriends;
    map['gender'] = _gender;
    map['fname'] = _fname;
    map['picsUrl'] = _picsUrl;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['email'] = _email;
    map['uuid'] = _uuid;
    map['username'] = _username;
    map['password'] = _password;
    if (_dob != null) {
      map['dob'] = _dob?.toJson();
    }
    if (_registered != null) {
      map['registered'] = _registered?.toJson();
    }
    if (_schools != null) {
      map['schools'] = _schools?.toJson();
    }
    map['phone'] = _phone;
    return map;
  }

}

/// name : "name uni"
/// faculty : "Med"
/// classNumber : 3

Schools schoolsFromJson(String str) => Schools.fromJson(json.decode(str));
String schoolsToJson(Schools data) => json.encode(data.toJson());
class Schools {
  Schools({
      String? name, 
      String? faculty, 
      int? classNumber,}){
    _name = name;
    _faculty = faculty;
    _classNumber = classNumber;
}

  Schools.fromJson(dynamic json) {
    _name = json['name'];
    _faculty = json['faculty'];
    _classNumber = json['classNumber'];
  }
  String? _name;
  String? _faculty;
  int? _classNumber;

  String? get name => _name;
  String? get faculty => _faculty;
  int? get classNumber => _classNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['faculty'] = _faculty;
    map['classNumber'] = _classNumber;
    return map;
  }

}

/// date : "2002-05-21T10:59:49.966Z"
/// age : 17

Registered registeredFromJson(String str) => Registered.fromJson(json.decode(str));
String registeredToJson(Registered data) => json.encode(data.toJson());
class Registered {
  Registered({
      String? date, 
      int? age,}){
    _date = date;
    _age = age;
}

  Registered.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;

  String? get date => _date;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }

}

/// date : "1993-07-20T09:44:18.674Z"
/// age : 26

Dob dobFromJson(String str) => Dob.fromJson(json.decode(str));
String dobToJson(Dob data) => json.encode(data.toJson());
class Dob {
  Dob({
      String? date, 
      int? age,}){
    _date = date;
    _age = age;
}

  Dob.fromJson(dynamic json) {
    _date = json['date'];
    _age = json['age'];
  }
  String? _date;
  int? _age;

  String? get date => _date;
  int? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['age'] = _age;
    return map;
  }

}

/// street : "9278 new road"
/// city : "kilcoole"
/// state : "waterford"
/// postcode : "93027"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? street, 
      String? city, 
      String? state, 
      String? postcode,}){
    _street = street;
    _city = city;
    _state = state;
    _postcode = postcode;
}

  Location.fromJson(dynamic json) {
    _street = json['street'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
  }
  String? _street;
  String? _city;
  String? _state;
  String? _postcode;

  String? get street => _street;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    return map;
  }

}