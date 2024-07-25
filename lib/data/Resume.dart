/// educations : [{"end_date":"2019","major":"資訊工程系","school":"逢甲大學","start_date":"2017"},{"end_date":"2014","major":"高中","school":"路竹高中","start_date":"2012"}]
/// img : "https://i.imgur.com/GGsyErT.jpg"
/// job_title : "Android工程師"
/// name : "蔡尚霖"
/// self_introduction : "擁有四年Android工作經歷，目前主要維護和開發影音類型APP，會把工作上遇到的問題和解決方法放在Github和Medium分享，與設計合作產出高品質UI/UX產品，遵循Clean Code和Design Pattern產出易維護的程式碼，使用Testing維護程式碼的品質，也有研究過Flutter對於跨平台有興趣。"
/// skills : [{"items":["Kotlin","Java","Dart","Python","C"],"title":"Programming"},{"items":["Jetpack","Git","Firebase","Google Play","Compose","SQL"],"title":"Skill"},{"items":["Chinese","English"],"title":"Language"},{"items":["Glide","Firebase","Epoxy","Room","RxJava","Coroutine","Retorfit","Okhttp","GSYPlayer"],"title":"Third Library"},{"items":["Firebase Analytics","Flurry"],"title":"User Tracker"}]
/// socials : [{"icon":"https://i.imgur.com/nHw6kNr.png","link":"https://github.com/CiaShangLin","title":"Github"},{"icon":"https://i.imgur.com/tFQtPLX.png","link":"https://medium.com/@west7418","title":"Medium"},{"icon":"https://i.imgur.com/g9UMc3n.png","link":"https://www.linkedin.com/in/%E5%B0%9A%E9%9C%96-%E8%94%A1-a05878175/","title":"Linkedin"}]
/// work_experiences : [{"company":"日新","description":"\n2024/2~now\n\n維護舊專案\n\n1.優化程式碼刪除冗餘無用程式碼\n\n2.重構程式碼補上測試\n\n3.使用OOP+Design Pattern簡化共用大量重複程式碼\n\n4.減少Api流量，處理生命週期token api 優化從每分鐘3600次->500次， 減少80%\n\n5.影片測速Api 優化減少每分鐘20%\n\n6.耗時工作改到IO線程減少UI卡頓,例如:寫入資料到SP裡面，查詢安裝APP...\n\n7.優化首頁UI卡頓,提升存留率約1%左右\n\n2019/7~2024/1\n\n主要負責影音APP維護和開發\n1.Firebase Crashlytics不受當機率優化從94%->99.5%\n2.添加Android防破解技術(NDK)\n3.將專案從Java轉成純Kotlin\n4.從MVP架構轉型成MVVM架構\n5.編寫單元測試和UI測試維護程式碼品質 \n6.減少apk包大小約縮小了40%\n7.繼承GsyPlayer擴展成我司的播放器，配合maven讓其他專案可以共用\n8.用GsyPlayer+MD360Player4Android，客製化VR播放器\n9.使用OOP減少重複程式碼，增加內聚力減低耦合\n10.使用Design Pattern優化開發速度\n11.減少Layout層級優化渲染時間\n12.封裝抽象第三方套件，易於抽換和擴增\n13.嘗試轉型成Flutter\n","end_date":"now","position":"Android工程師","start_date":"2019/7/1"}]

class Resume {
  Resume({
      List<Educations>? educations, 
      String? img, 
      String? jobTitle, 
      String? name, 
      String? selfIntroduction, 
      List<Skills>? skills, 
      List<Socials>? socials, 
      List<WorkExperiences>? workExperiences,}){
    _educations = educations;
    _img = img;
    _jobTitle = jobTitle;
    _name = name;
    _selfIntroduction = selfIntroduction;
    _skills = skills;
    _socials = socials;
    _workExperiences = workExperiences;
}

  Resume.fromJson(dynamic json) {
    if (json['educations'] != null) {
      _educations = [];
      json['educations'].forEach((v) {
        _educations?.add(Educations.fromJson(v));
      });
    }
    _img = json['img'];
    _jobTitle = json['job_title'];
    _name = json['name'];
    _selfIntroduction = json['self_introduction'];
    if (json['skills'] != null) {
      _skills = [];
      json['skills'].forEach((v) {
        _skills?.add(Skills.fromJson(v));
      });
    }
    if (json['socials'] != null) {
      _socials = [];
      json['socials'].forEach((v) {
        _socials?.add(Socials.fromJson(v));
      });
    }
    if (json['work_experiences'] != null) {
      _workExperiences = [];
      json['work_experiences'].forEach((v) {
        _workExperiences?.add(WorkExperiences.fromJson(v));
      });
    }
  }
  List<Educations>? _educations;
  String? _img;
  String? _jobTitle;
  String? _name;
  String? _selfIntroduction;
  List<Skills>? _skills;
  List<Socials>? _socials;
  List<WorkExperiences>? _workExperiences;
Resume copyWith({  List<Educations>? educations,
  String? img,
  String? jobTitle,
  String? name,
  String? selfIntroduction,
  List<Skills>? skills,
  List<Socials>? socials,
  List<WorkExperiences>? workExperiences,
}) => Resume(  educations: educations ?? _educations,
  img: img ?? _img,
  jobTitle: jobTitle ?? _jobTitle,
  name: name ?? _name,
  selfIntroduction: selfIntroduction ?? _selfIntroduction,
  skills: skills ?? _skills,
  socials: socials ?? _socials,
  workExperiences: workExperiences ?? _workExperiences,
);
  List<Educations>? get educations => _educations;
  String? get img => _img;
  String? get jobTitle => _jobTitle;
  String? get name => _name;
  String? get selfIntroduction => _selfIntroduction;
  List<Skills>? get skills => _skills;
  List<Socials>? get socials => _socials;
  List<WorkExperiences>? get workExperiences => _workExperiences;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_educations != null) {
      map['educations'] = _educations?.map((v) => v.toJson()).toList();
    }
    map['img'] = _img;
    map['job_title'] = _jobTitle;
    map['name'] = _name;
    map['self_introduction'] = _selfIntroduction;
    if (_skills != null) {
      map['skills'] = _skills?.map((v) => v.toJson()).toList();
    }
    if (_socials != null) {
      map['socials'] = _socials?.map((v) => v.toJson()).toList();
    }
    if (_workExperiences != null) {
      map['work_experiences'] = _workExperiences?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// company : "日新"
/// description : "\n2024/2~now\n\n維護舊專案\n\n1.優化程式碼刪除冗餘無用程式碼\n\n2.重構程式碼補上測試\n\n3.使用OOP+Design Pattern簡化共用大量重複程式碼\n\n4.減少Api流量，處理生命週期token api 優化從每分鐘3600次->500次， 減少80%\n\n5.影片測速Api 優化減少每分鐘20%\n\n6.耗時工作改到IO線程減少UI卡頓,例如:寫入資料到SP裡面，查詢安裝APP...\n\n7.優化首頁UI卡頓,提升存留率約1%左右\n\n2019/7~2024/1\n\n主要負責影音APP維護和開發\n1.Firebase Crashlytics不受當機率優化從94%->99.5%\n2.添加Android防破解技術(NDK)\n3.將專案從Java轉成純Kotlin\n4.從MVP架構轉型成MVVM架構\n5.編寫單元測試和UI測試維護程式碼品質 \n6.減少apk包大小約縮小了40%\n7.繼承GsyPlayer擴展成我司的播放器，配合maven讓其他專案可以共用\n8.用GsyPlayer+MD360Player4Android，客製化VR播放器\n9.使用OOP減少重複程式碼，增加內聚力減低耦合\n10.使用Design Pattern優化開發速度\n11.減少Layout層級優化渲染時間\n12.封裝抽象第三方套件，易於抽換和擴增\n13.嘗試轉型成Flutter\n"
/// end_date : "now"
/// position : "Android工程師"
/// start_date : "2019/7/1"

class WorkExperiences {
  WorkExperiences({
      String? company, 
      String? description, 
      String? endDate, 
      String? position, 
      String? startDate,}){
    _company = company;
    _description = description;
    _endDate = endDate;
    _position = position;
    _startDate = startDate;
}

  WorkExperiences.fromJson(dynamic json) {
    _company = json['company'];
    _description = json['description'];
    _endDate = json['end_date'];
    _position = json['position'];
    _startDate = json['start_date'];
  }
  String? _company;
  String? _description;
  String? _endDate;
  String? _position;
  String? _startDate;
WorkExperiences copyWith({  String? company,
  String? description,
  String? endDate,
  String? position,
  String? startDate,
}) => WorkExperiences(  company: company ?? _company,
  description: description ?? _description,
  endDate: endDate ?? _endDate,
  position: position ?? _position,
  startDate: startDate ?? _startDate,
);
  String? get company => _company;
  String? get description => _description;
  String? get endDate => _endDate;
  String? get position => _position;
  String? get startDate => _startDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company'] = _company;
    map['description'] = _description;
    map['end_date'] = _endDate;
    map['position'] = _position;
    map['start_date'] = _startDate;
    return map;
  }

}

/// icon : "https://i.imgur.com/nHw6kNr.png"
/// link : "https://github.com/CiaShangLin"
/// title : "Github"

class Socials {
  Socials({
      String? icon, 
      String? link, 
      String? title,}){
    _icon = icon;
    _link = link;
    _title = title;
}

  Socials.fromJson(dynamic json) {
    _icon = json['icon'];
    _link = json['link'];
    _title = json['title'];
  }
  String? _icon;
  String? _link;
  String? _title;
Socials copyWith({  String? icon,
  String? link,
  String? title,
}) => Socials(  icon: icon ?? _icon,
  link: link ?? _link,
  title: title ?? _title,
);
  String? get icon => _icon;
  String? get link => _link;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = _icon;
    map['link'] = _link;
    map['title'] = _title;
    return map;
  }

}

/// items : ["Kotlin","Java","Dart","Python","C"]
/// title : "Programming"

class Skills {
  Skills({
      List<String>? items, 
      String? title,}){
    _items = items;
    _title = title;
}

  Skills.fromJson(dynamic json) {
    _items = json['items'] != null ? json['items'].cast<String>() : [];
    _title = json['title'];
  }
  List<String>? _items;
  String? _title;
Skills copyWith({  List<String>? items,
  String? title,
}) => Skills(  items: items ?? _items,
  title: title ?? _title,
);
  List<String>? get items => _items;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['items'] = _items;
    map['title'] = _title;
    return map;
  }

}

/// end_date : "2019"
/// major : "資訊工程系"
/// school : "逢甲大學"
/// start_date : "2017"

class Educations {
  Educations({
      String? endDate, 
      String? major, 
      String? school, 
      String? startDate,}){
    _endDate = endDate;
    _major = major;
    _school = school;
    _startDate = startDate;
}

  Educations.fromJson(dynamic json) {
    _endDate = json['end_date'];
    _major = json['major'];
    _school = json['school'];
    _startDate = json['start_date'];
  }
  String? _endDate;
  String? _major;
  String? _school;
  String? _startDate;
Educations copyWith({  String? endDate,
  String? major,
  String? school,
  String? startDate,
}) => Educations(  endDate: endDate ?? _endDate,
  major: major ?? _major,
  school: school ?? _school,
  startDate: startDate ?? _startDate,
);
  String? get endDate => _endDate;
  String? get major => _major;
  String? get school => _school;
  String? get startDate => _startDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['end_date'] = _endDate;
    map['major'] = _major;
    map['school'] = _school;
    map['start_date'] = _startDate;
    return map;
  }

}