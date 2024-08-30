/// data : [{"id":833714850,"name":"PersonalWebSite","html_url":"https://github.com/CiaShangLin/PersonalWebSite","description":null,"visibility":"public","updated_at":"2024-07-25T15:52:22Z"},{"id":815585915,"name":"YoutubeUpload","html_url":"https://github.com/CiaShangLin/YoutubeUpload","description":null,"visibility":"public","updated_at":"2024-07-09T13:36:05Z"},{"id":457253415,"name":"JetpackMovie","html_url":"https://github.com/CiaShangLin/JetpackMovie","description":null,"visibility":"public","updated_at":"2024-05-14T09:06:08Z"},{"id":667048128,"name":"JetpackMovieCompose","html_url":"https://github.com/CiaShangLin/JetpackMovieCompose","description":null,"visibility":"public","updated_at":"2024-05-14T08:58:37Z"},{"id":709702993,"name":"ShangCustomViewPractice","html_url":"https://github.com/CiaShangLin/ShangCustomViewPractice","description":null,"visibility":"public","updated_at":"2023-10-25T08:22:56Z"},{"id":690878740,"name":"EventTracker","html_url":"https://github.com/CiaShangLin/EventTracker","description":null,"visibility":"public","updated_at":"2023-09-13T04:22:28Z"},{"id":417010557,"name":"App-Protect","html_url":"https://github.com/CiaShangLin/App-Protect","description":null,"visibility":"public","updated_at":"2023-07-21T20:04:53Z"},{"id":228320338,"name":"JniDemo","html_url":"https://github.com/CiaShangLin/JniDemo","description":null,"visibility":"public","updated_at":"2023-07-21T20:04:08Z"},{"id":498230919,"name":"ImageAppWidget","html_url":"https://github.com/CiaShangLin/ImageAppWidget","description":null,"visibility":"public","updated_at":"2022-05-31T07:28:00Z"},{"id":180580850,"name":"LeetCode","html_url":"https://github.com/CiaShangLin/LeetCode","description":null,"visibility":"public","updated_at":"2021-12-29T10:35:21Z"},{"id":422536115,"name":"FlutterMaskMap","html_url":"https://github.com/CiaShangLin/FlutterMaskMap","description":null,"visibility":"public","updated_at":"2021-12-03T03:34:06Z"},{"id":433651145,"name":"AndroidIconText","html_url":"https://github.com/CiaShangLin/AndroidIconText","description":null,"visibility":"public","updated_at":"2021-12-02T07:52:52Z"},{"id":307263673,"name":"Design-Pattern","html_url":"https://github.com/CiaShangLin/Design-Pattern","description":null,"visibility":"public","updated_at":"2021-03-02T08:03:08Z"},{"id":258746572,"name":"ScreenShot-Detector","html_url":"https://github.com/CiaShangLin/ScreenShot-Detector","description":null,"visibility":"public","updated_at":"2020-04-25T13:29:14Z"},{"id":257594058,"name":"Android-Compression-Apk","html_url":"https://github.com/CiaShangLin/Android-Compression-Apk","description":null,"visibility":"public","updated_at":"2020-04-21T13:45:58Z"},{"id":257529169,"name":"Dynamic-Launcher-Icon","html_url":"https://github.com/CiaShangLin/Dynamic-Launcher-Icon","description":null,"visibility":"public","updated_at":"2020-04-21T08:30:04Z"},{"id":156990890,"name":"CheapGas","html_url":"https://github.com/CiaShangLin/CheapGas","description":null,"visibility":"public","updated_at":"2020-04-18T17:29:38Z"},{"id":165062013,"name":"FUC_food","html_url":"https://github.com/CiaShangLin/FUC_food","description":null,"visibility":"public","updated_at":"2020-04-18T17:29:38Z"},{"id":144439424,"name":"MediaPlayerByKotlin","html_url":"https://github.com/CiaShangLin/MediaPlayerByKotlin","description":null,"visibility":"public","updated_at":"2020-04-18T17:29:38Z"}]

class Github {
  Github({
    List<Data>? data,
  }) {
    _data = data;
  }

  Github.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  List<Data>? _data;

  Github copyWith({
    List<Data>? data,
  }) =>
      Github(
        data: data ?? _data,
      );

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 833714850
/// name : "PersonalWebSite"
/// html_url : "https://github.com/CiaShangLin/PersonalWebSite"
/// description : null
/// visibility : "public"
/// updated_at : "2024-07-25T15:52:22Z"

class Data {
  Data({
    num? id,
    String? name,
    String? htmlUrl,
    dynamic description,
    String? visibility,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _htmlUrl = htmlUrl;
    _description = description;
    _visibility = visibility;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _htmlUrl = json['html_url'];
    _description = json['description'];
    _visibility = json['visibility'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  String? _htmlUrl;
  dynamic _description;
  String? _visibility;
  String? _updatedAt;

  Data copyWith({
    num? id,
    String? name,
    String? htmlUrl,
    dynamic description,
    String? visibility,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        htmlUrl: htmlUrl ?? _htmlUrl,
        description: description ?? _description,
        visibility: visibility ?? _visibility,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  String? get htmlUrl => _htmlUrl;

  dynamic get description => _description;

  String? get visibility => _visibility;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['html_url'] = _htmlUrl;
    map['description'] = _description;
    map['visibility'] = _visibility;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
