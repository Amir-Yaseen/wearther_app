class CurrentCondition {
  int? code;
  String? day;
  String? night;
  int? icon;

  CurrentCondition({this.code, this.day, this.night, this.icon});

  CurrentCondition.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    day = json['day'];
    night = json['night'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['day'] = day;
    data['night'] = night;
    data['icon'] = icon;
    return data;
  }
}